local M = {}
local pending_update = false

local function in_tmux()
    return vim.env.TMUX ~= nil and vim.env.TMUX ~= ""
end

local function tmux(args)
    if not in_tmux() then
        return
    end

    vim.system(vim.list_extend({ "tmux" }, args), { text = true })
end

local function compact(parts)
    local out = {}
    for _, part in ipairs(parts) do
        if part ~= nil and part ~= "" then
            table.insert(out, part)
        end
    end
    return table.concat(out, " ")
end

local function color(value)
    if value == nil then
        return "default"
    end

    return string.format("#%06x", value)
end

local function tmux_escape(value)
    return value:gsub("#", "##")
end

local function style(group)
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
    if not ok then
        return "#[default]"
    end

    local parts = {
        "fg=" .. color(hl.fg),
        "bg=" .. color(hl.bg),
    }

    if hl.bold then
        table.insert(parts, "bold")
    end

    if hl.italic then
        table.insert(parts, "italics")
    end

    return "#[" .. table.concat(parts, ",") .. "]"
end

local function segment(text, group)
    if text == nil or text == "" then
        return ""
    end

    return style(group) .. " " .. tmux_escape(text) .. " " .. "#[default]"
end

local function eval_statusline(value)
    if value == nil or value == "" then
        return ""
    end

    return vim.api.nvim_eval_statusline(value, { maxwidth = 80 }).str
end

local function filename()
    if vim.bo.buftype == "terminal" then
        return vim.fn.expand("%:t")
    end

    local name = vim.fn.expand("%:~:.")
    if name == "" then
        name = "[No Name]"
    end

    if vim.bo.modified then
        name = name .. " [+]"
    end

    if vim.bo.readonly or not vim.bo.modifiable then
        name = name .. " [-]"
    end

    return name
end

function M.update_now()
    pending_update = false

    if not in_tmux() then
        return
    end

    local ok, statusline = pcall(require, "mini.statusline")
    if not ok then
        return
    end

    local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
    local left = compact({
        segment(mode, mode_hl),
        segment(filename(), "MiniStatuslineFilename"),
    })
    local right = compact({
        segment(statusline.section_git({ trunc_width = 40 }), "MiniStatuslineDevinfo"),
        segment(statusline.section_diff({ trunc_width = 40 }), "MiniStatuslineDevinfo"),
        segment(statusline.section_diagnostics({ trunc_width = 40 }), "MiniStatuslineDevinfo"),
        segment(statusline.section_lsp({ trunc_width = 75 }), "MiniStatuslineDevinfo"),
        segment(statusline.section_fileinfo({ trunc_width = 120 }), "MiniStatuslineFileinfo"),
        segment(eval_statusline(statusline.section_location({ trunc_width = 75 })), "MiniStatuslineFileinfo"),
    })

    tmux({ "set-option", "-pq", "@nvim_status_left", left })
    tmux({ "set-option", "-pq", "@nvim_status_right", right })
    tmux({ "refresh-client", "-S" })
end

function M.update()
    if pending_update then
        return
    end

    pending_update = true
    vim.defer_fn(M.update_now, 80)
end

function M.clear()
    pending_update = false

    if not in_tmux() then
        return
    end

    tmux({ "set-option", "-puq", "@nvim_status_left" })
    tmux({ "set-option", "-puq", "@nvim_status_right" })
    tmux({ "refresh-client", "-S" })
end

function M.setup()
    if not in_tmux() then
        return
    end

    vim.opt.laststatus = 0

    local group = vim.api.nvim_create_augroup("TmuxStatusline", { clear = true })
    vim.api.nvim_create_autocmd({
        "BufEnter",
        "BufWritePost",
        "CursorMoved",
        "CursorMovedI",
        "DiagnosticChanged",
        "FocusGained",
        "ModeChanged",
    }, {
        group = group,
        callback = M.update,
    })

    vim.api.nvim_create_autocmd({ "FocusLost", "VimLeavePre" }, {
        group = group,
        callback = M.clear,
    })

    M.update_now()
end

return M

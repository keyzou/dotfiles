vim.g.opencode_opts = {
    -- Keep defaults for the embedded terminal server. Enable LSP here later if
    -- you want opencode hover/code-action integrations.
}

vim.o.autoread = true

local function opencode()
    return require("opencode")
end

local function focus_opencode()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local name = vim.api.nvim_buf_get_name(buf)

        if vim.bo[buf].buftype == "terminal" and name:find("opencode", 1, true) then
            vim.api.nvim_set_current_win(win)
            vim.cmd.startinsert()
            return true
        end
    end

    return false
end

local function toggle_opencode()
    opencode().toggle()
    vim.defer_fn(focus_opencode, 100)
end

vim.keymap.set({ "n", "x" }, "<leader>oa", function()
    opencode().ask("@this: ", { submit = true })
end, { desc = "Ask opencode about this" })

vim.keymap.set({ "n", "x" }, "<leader>oA", function()
    opencode().ask("@this: ")
end, { desc = "Compose opencode ask" })

vim.keymap.set({ "n", "x" }, "<leader>os", function()
    opencode().select()
end, { desc = "Select opencode action" })

vim.keymap.set("n", "<leader>oo", function()
    toggle_opencode()
end, { desc = "Toggle and focus opencode" })

vim.keymap.set("n", "<leader>of", function()
    if not focus_opencode() then
        toggle_opencode()
    end
end, { desc = "Focus opencode" })

vim.keymap.set("n", "<leader>on", function()
    opencode().command("session.new")
end, { desc = "New opencode session" })

vim.keymap.set({ "n", "x" }, "go", function()
    return opencode().operator("@this ")
end, { desc = "Add range to opencode", expr = true })

vim.keymap.set("n", "goo", function()
    return opencode().operator("@this ") .. "_"
end, { desc = "Add line to opencode", expr = true })

vim.keymap.set("n", "<leader>ou", function()
    opencode().command("session.half.page.up")
end, { desc = "Scroll opencode up" })

vim.keymap.set("n", "<leader>od", function()
    opencode().command("session.half.page.down")
end, { desc = "Scroll opencode down" })

vim.api.nvim_create_autocmd("TermOpen", {
    callback = function(event)
        local name = vim.api.nvim_buf_get_name(event.buf)

        if not name:find("opencode", 1, true) then
            return
        end

        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = event.buf, desc = "Leave opencode input" })
        vim.keymap.set({ "n", "t" }, "<C-c>", function()
            opencode().command("prompt.clear")
        end, { buffer = event.buf, desc = "Clear opencode input" })

        vim.defer_fn(function()
            if vim.api.nvim_buf_is_valid(event.buf) then
                vim.keymap.set("n", "<Esc>", [[<C-w>h]], { buffer = event.buf, desc = "Return to editor" })
            end
        end, 0)
    end,
})

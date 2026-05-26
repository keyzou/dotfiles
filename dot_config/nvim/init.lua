require("vim._core.ui2").enable({})

require("options")
require("keymaps")
require("commands")
require("pack")

vim.cmd.colorscheme("kanagawa-wave")

local function transparent_statusline()
    local groups = {
        "StatusLine",
        "StatusLineNC",
        "MiniStatuslineFilename",
        "MiniStatuslineInactive",
    }

    for _, group in ipairs(groups) do
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
        if ok then
            hl.bg = nil
            hl.ctermbg = nil
            vim.api.nvim_set_hl(0, group, hl)
        end
    end
end

transparent_statusline()
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = transparent_statusline,
})

vim.pack.add({
    "https://github.com/bluz71/vim-moonfly-colors",
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/romus204/tree-sitter-manager.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/tpope/vim-fugitive",
})

-- Mini files --
local MiniFiles = require("mini.files")

require("mini.files").setup({
    mappings = {
        go_in = "<CR>",
        go_in_plus = "L",
        go_out = "_",
        go_out_plus = "H",
    },
})
vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
vim.keymap.set("n", "<leader>-", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })


-- Mini notify --

require("mini.notify").setup({
    content = {
        format = function(notif)
            return notif.msg
        end,
    },
})


require("mini.cmdline").setup({
    autocorrect = { enabled = false }
})

require("mini.surround").setup()


local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")

MiniPick.setup()
MiniExtra.setup()

vim.keymap.set("n", "<leader><leader>", function() MiniPick.builtin.files() end, { desc = "Mini file picker" })
vim.keymap.set("n", "<leader>ps", function() MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") }) end,
    { desc = "Mini word picker" })
vim.keymap.set("n", "<leader>vh", function() MiniPick.builtin.help() end, { desc = "Mini word picker" })

vim.keymap.set("n", "<leader>xx", function() MiniExtra.pickers.diagnostic() end, { desc = "Diagnostics picker" })
vim.keymap.set("n", "<leader>vk", function() MiniExtra.pickers.keymaps() end, { desc = "View keymaps" })



require("mini.completion").setup({
    lsp_completion = {
        auto_setup = true,
    }
})


local MiniSnippets = require("mini.snippets")

MiniSnippets.setup({
    snippets = {
        MiniSnippets.gen_loader.from_lang(),
    },
    expand = {
        insert = function(snippet)
            MiniSnippets.default_insert(snippet, { empty_tabstop = "" })
        end
    }
})

MiniSnippets.start_lsp_server({ match = false })

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "MiniSnippetsCurrent", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsCurrentReplace", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsFinal", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsUnvisited", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsVisited", {})
    end
})

local MiniDiff = require("mini.diff")
MiniDiff.setup({
    source = MiniDiff.gen_source.git({ index = false })
})

vim.keymap.set("n", "<leader>gg", "<cmd>tabnew | Git | only<CR>", { desc = "Fugitive full page new tab"})
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "Git diff split"})

local MiniClue = require("mini.clue")

MiniClue.setup({
    triggers = {
        { mode = "n", keys = "<leader>" },
        { mode = "n", keys = "g" },
        { mode = "n", keys = "<C-w>" },
    },
    clues = {
        MiniClue.gen_clues.g(),
        MiniClue.gen_clues.windows({ submode_resize = true}),
        MiniClue.gen_clues.builtin_completion(),
        MiniClue.gen_clues.registers(),
    },
    window = {
        delay = 50,
        config = {
            width = 'auto',
            border = 'double',
        }
    }
})

require("mini.jump").setup()
require("mini.hipatterns").setup()
require("mini.icons").setup()

require("mini.statusline").setup()

require("treesitter")
require("lsp")

vim.pack.add({
    "https://github.com/rebelot/kanagawa.nvim",
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/romus204/tree-sitter-manager.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/folke/snacks.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/folke/noice.nvim",
    "https://github.com/folke/sidekick.nvim",
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
vim.notify = require("mini.notify").make_notify()


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
vim.keymap.set("n", "<leader>vh", function() MiniPick.builtin.help() end, { desc = "Help page picker" })
vim.keymap.set("n", "<leader>vo", function() MiniExtra.pickers.oldfiles() end, { desc = "Mini word picker" })

vim.keymap.set("n", "<leader>xx", function() MiniExtra.pickers.diagnostic() end, { desc = "Diagnostics picker" })
vim.keymap.set("n", "<leader>vk", function() MiniExtra.pickers.keymaps() end, { desc = "View keymaps" })
vim.keymap.set("n", "<leader>vH", function() MiniExtra.pickers.hl_groups() end, { desc = "View HLs" })



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

vim.keymap.set("n", "<leader>gg", "<cmd>tabnew | Git | only<CR>", { desc = "Fugitive full page new tab" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "Git diff split" })

local MiniClue = require("mini.clue")

MiniClue.setup({
    triggers = {
        { mode = "n", keys = "<leader>" },
        { mode = "n", keys = "g" },
        { mode = "n", keys = "<C-w>" },
    },
    clues = {
        MiniClue.gen_clues.g(),
        MiniClue.gen_clues.windows({ submode_resize = true }),
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

local minipairs = require("mini.pairs")
minipairs.setup({
    modes = { insert = true, command = false, terminal = false }
})
require("mini.ai").setup()

require("mini.jump").setup()
require("mini.hipatterns").setup()
require("mini.icons").setup()

require("mini.statusline").setup()
require("tmux_statusline").setup()

require("snacks").setup({
    animate = { enabled = true },
    statuscolumn = { enabled = true },
    input = { enabled = true },
    picker = {
        enabled = true,
        actions = {
            sidekick_send = function(...)
                return require("sidekick.cli.picker.snacks").send(...)
            end,
        },
        win = {
            input = {
                keys = {
                    ["<a-a>"] = { "sidekick_send", mode = { "n", "i" } },
                },
            },
        },
    },
})
vim.o.statuscolumn = "%=%{v:relnum?v:relnum:v:lnum} %#Normal# "

require("sidekick_config")

require("noice").setup({
    routes = {
        {
            filter = {
                event = "msg_show",
                kind = "",
                find = '^".*" %d+L, %d+B',
            },
            opts = { skip = true },
        },
    },
})

require("treesitter")
require("lsp")

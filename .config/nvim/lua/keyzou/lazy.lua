local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({ { import = "keyzou.plugins" }, { import = "keyzou.plugins.lsp" } }, {
  install = {
    colorscheme = { "catppuccin-mocha" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

-- require("lazy").setup({
--   { "christoomey/vim-tmux-navigator" },
--   { "szw/vim-maximizer" },
--   
--   { "tpope/vim-surround" },
--   { "vim-scripts/ReplaceWithRegister" },
--   { 
--     "numToStr/Comment.nvim",
--     lazy = false,
--     config = function()
--       require("keyzou.plugins.comment")
--     end
--   },
--
--   { 
--     "nvim-tree/nvim-tree.lua",
--     version = "*",
--     lazy = false,
--     dependencies = {
--       "nvim-tree/nvim-web-devicons",
--     },
--     config = function()
--       require("keyzou.plugins.nvim-tree")
--     end
--   },
--   { 
--     "nvim-lualine/lualine.nvim",
--     config = function()
--       require("keyzou.plugins.lualine")
--     end
--   },
--
--   { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
--   {
--     'nvim-telescope/telescope.nvim', 
--     branch = "0.1.x",
--     config = function()
--       require("keyzou.plugins.telescope")
--     end,
--     dependencies = {
--       "nvim-lua/plenary.nvim"
--     },
--   },
--
--   {"hrsh7th/nvim-cmp"},
--   {"hrsh7th/cmp-buffer"},
--   {"hrsh7th/cmp-path"},
--
--   {
--     "L3MON4D3/LuaSnip",
--     version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
--     dependencies = { "rafamadriz/friendly-snippets", "saadparwaiz1/cmp_luasnip", "hrsh7th/nvim-cmp" },
--     config = function()
--       require("keyzou.plugins.nvim-cmp")
--     end
--   },
--
--   { "williamboman/mason.nvim", dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" }, config = function()
--     require("keyzou.plugins.lsp.mason")
--   end
--   },
--
--   { "hrsh7th/cmp-nvim-lsp" },
--   { 
--     "glepnir/lspsaga.nvim",
--     event = "LspAttach",
--     dependencies = {
--         'nvim-treesitter/nvim-treesitter', -- optional
--         'nvim-tree/nvim-web-devicons'     -- optional
--     },
--   },
--
--   {
--     "pmizio/typescript-tools.nvim",
--     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
--     opts = {},
--   },


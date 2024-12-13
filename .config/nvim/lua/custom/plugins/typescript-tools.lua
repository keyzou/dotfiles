return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    require('typescript-tools').setup {
      jsx_close_tag = {
        enable = true,
        filetypes = { 'javascriptreact', 'typescriptreact' },
      },
    }
    vim.keymap.set('n', '<leader>oi', '<cmd>TSToolsOrganizeImports<CR>', { desc = '[O]rganize [I]mports' })
  end,
}

-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
    config = function()
      require('typescript-tools').setup {}
      local keymap = vim.keymap
      keymap.set('n', '<leader>oi', '<CMD>TSToolsOrganizeImports<CR>', { desc = '[O]rganize [I]mports' })
    end,
  },
}

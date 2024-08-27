return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  config = function()
    require('barbar').setup {
      sidebar_filetypes = {
        ['neo-tree'] = true,
      },
    }
    vim.keymap.set('n', '<C-p>', '<CMD>BufferPick<CR>', { desc = 'Open buffer picker' })
    vim.keymap.set('n', '<Tab>', '<CMD>BufferNext<CR>', { desc = 'Move to next buffer' })
    vim.keymap.set('n', '<S-Tab>', '<CMD>BufferPrevious<CR>', { desc = 'Move to previous buffer' })
    vim.keymap.set('n', '<leader>tx', '<CMD>BufferClose<CR>', { desc = 'Close current buffer' })
  end,
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}

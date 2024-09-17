return {
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = {
    {
      '<leader>dd',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = '[D]iagnostics (Workspace)',
    },
    {
      '<leader>dD',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
  },
}

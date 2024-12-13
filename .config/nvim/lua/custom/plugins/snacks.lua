return {
  'folke/snacks.nvim',
  keys = {
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      '<leader>S',
      function()
        Snacks.scratch.select()
      end,
      desc = 'Select Scratch Buffer',
    },
  },
  opts = {
    bigfile = {},
    notifier = {},
    quickfile = {},
    dim = {},
    indent = {
      only_scope = true,
      scope = {
        only_current = true,
        animate = {
          enabled = false,
        },
      },
    },
    scratch = {},
    scope = {},
    input = {},
  },
}

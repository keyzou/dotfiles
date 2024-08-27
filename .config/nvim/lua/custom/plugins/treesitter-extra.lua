-- Treesitter extra plugins
return {
  {
    -- Gives context lines at the top of the editor for the current cursor position
    'nvim-treesitter/nvim-treesitter-context',
    lazy = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesitter-context').setup()
    end,
  },
  -- Context-aware comment strings (mostly for JS/TS)
  'JoosepAlviste/nvim-ts-context-commentstring',
  -- Auto-closing HTML tags
  'windwp/nvim-ts-autotag',
}

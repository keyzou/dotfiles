return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("onedarkpro").setup({
      colors = {
        picker_bg = "require('onedarkpro.helpers').darken('bg', 3, 'onedark')",
        tscontext = "require('onedarkpro.helpers').brighten('bg', 4, 'onedark')",
      },
      highlights = {
        WinSeparator = {
          bg = "${bg}",
          fg = "${bg}",
        },
        TreesitterContextBottom = {
          bg = "${tscontext}",
          fg = "${tscontext}",
        },
        TreesitterContextSeparator = {
          bg = "${tscontext}",
          fg = "${tscontext}",
        },
        TreesitterContext = {
          bg = "${tscontext}",
        },
        TreesitterContextLineNumber = {
          bg = "${tscontext}",
          fg = "${gray}",
        },
        SnacksPickerGitStatusUntracked = {
          link = "Comment",
        },
        SnacksPickerGitStatusIgnored = {
          link = "Comment",
        },
        SnacksPickerTotals = {
          link = "Comment",
        },
        SnacksPickerTree = {
          fg = "${bg}",
        },
        SnacksPickerUnselected = {
          bg = "${picker_bg}",
          fg = "${gray}",
        },
        SnacksPickerPathIgnored = {
          bg = "${picker_bg}",
          fg = "${gray}",
          strikethrough = true,
        },
        SnacksPickerPathHidden = {
          bg = "${picker_bg}",
          fg = "${gray}",
          italic = true,
        },
        FzfLuaPreviewBorder = {
          bg = "${bg}",
          fg = "${bg}",
        },
        FzfLuaPreviewNormal = {
          bg = "${bg}",
        },
        FzfLuaNormal = {
          bg = "${picker_bg}",
        },
        FzfLuaBackdrop = {
          bg = "#000000",
        },
        FzfLuaBorder = {
          bg = "${picker_bg}",
          fg = "${picker_bg}",
        },
      },
    })
    vim.cmd("colorscheme onedark")
  end,
}

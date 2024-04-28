return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				integrations = {
					lsp_saga = true,
					indent_blankline = {
						enabled = true,
						scope_color = "surface2",
						colored_indent_levels = true,
					},
					mason = true,
					harpoon = true,
					which_key = true,
					notify = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}

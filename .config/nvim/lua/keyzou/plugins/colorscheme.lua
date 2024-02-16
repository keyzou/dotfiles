return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin-mocha]])

			require("catppuccin").setup({
				integrations = {
					lsp_saga = true,
					mason = true,
					which_key = true,
					notify = true,
				},
			})
		end,
	},
}

return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "moon",
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				lualine_bold = true,
				dim_inactive = true,
				cache = true,
				on_colors = function(colors)
					colors.bg_statusline = colors.none
				end,
				---@param highlights tokyonight.Highlights
				---@param colors ColorScheme
				on_highlights = function(highlights, colors)
					highlights.Function = vim.tbl_extend("keep", highlights.Function, {
						bold = true,
					})
				end,
				plugins = {
					all = package.loaded.lazy == nil,
					auto = true,
				},
			})

			vim.cmd([[colorscheme tokyonight-moon]])
		end,
	},
}

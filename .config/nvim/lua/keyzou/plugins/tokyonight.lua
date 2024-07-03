return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				lualine_bold = true,
				dim_inactive = true,
				on_colors = function(colors)
					colors.bg_statusline = colors.none
				end,
				---@param hl Highlights
				---@param colors ColorScheme
				on_highlights = function(hl, colors)
					hl.CursorComment = {
						bg = hl.CursorLine.bg,
						fg = colors.comment,
					}
				end,
			})

			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}

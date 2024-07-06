return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				section_separators = { left = "", right = "" },
				component_separators = "|",
				theme = "tokyonight",
			},
			extensions = { "quickfix", "nvim-tree", "trouble", "fzf", "lazy" },
		})
	end,
}

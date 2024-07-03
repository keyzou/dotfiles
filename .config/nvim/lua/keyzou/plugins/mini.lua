return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.starter").setup()
		require("mini.colors").setup()
	end,
}

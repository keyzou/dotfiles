return {
	"rcarriga/nvim-notify",
	opts = {
		fps = 144,
		render = "compact",
		stages = "fade",
		background_color = "transparent",
	},
	init = function()
		vim.notify = require("notify")
	end,
}

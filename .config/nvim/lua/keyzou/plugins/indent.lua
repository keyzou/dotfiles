return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local ibl = require("ibl")

		ibl.setup({
			scope = {
				show_exact_scope = true,
				show_start = false,
				show_end = false,
			},
		})
	end,
}

return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = function()
		local neogit = require("neogit")
		local keymap = vim.keymap

		neogit.setup({})

		keymap.set("n", "<leader>gga", function()
			neogit.open({ kind = "floating" })
		end, { desc = "Open git status window" })
		keymap.set("n", "<leader>ggc", function()
			neogit.open({ "commit", kind = "floating" })
		end, { desc = "Open git commit window" })
	end,
}

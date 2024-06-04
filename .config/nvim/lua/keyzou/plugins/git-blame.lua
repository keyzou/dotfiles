return {
	"f-person/git-blame.nvim",
	config = function()
		require("gitblame").setup({
			date_format = "%r",
			highlight_group = "CursorComment",
			delay = 0,
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>gbo", "<CMD>GitBlameOpenCommitURL<CR>", { desc = "Open the blamed commit URL" })
	end,
}

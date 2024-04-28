return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")

		local keymap = vim.keymap

		keymap.set("n", "<leader>tdn", function()
			todo_comments.jump_next()
		end)

		keymap.set("n", "<leader>tdp", function()
			todo_comments.jump_prev()
		end)
		todo_comments.setup()
	end,
}

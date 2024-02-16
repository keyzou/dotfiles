return {
	"famiu/bufdelete.nvim",
	config = function()
		vim.keymap.set("n", "<leader>to", "<cmd>tabnew %<CR>") -- new tab
		vim.keymap.set("n", "<leader>tx", "<cmd>Bdelete<CR>") -- close tab
	end,
}

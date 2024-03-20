local keymap = vim.keymap

-- general keymaps
keymap.set("n", "<leader>nh", ":nohl<CR>") -- remove highlight
keymap.set("n", "x", '"_x') -- don't copy the char when deleting

keymap.set("n", "<ESC>", ":nohl<CR>")

keymap.set("n", "<leader>+", "<C-a>") -- increment number
keymap.set("n", "<leader>-", "<C-x>") -- decrement number

-- panes / windows
keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- balance panes
keymap.set("n", "<leader>sx", "<cmd>close<CR>") -- close current pane
keymap.set("n", "<leader>ih", function()
	vim.lsp.inlay_hint(0, nil)
end, { desc = "Toggle inlay hints" })
-- tabs

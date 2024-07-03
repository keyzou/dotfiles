return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- configure nvim-tree
		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			update_focused_file = { enable = true },
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		vim.api.nvim_create_autocmd("QuitPre", {
			callback = function()
				local tree_wins = {}
				local floating_wins = {}
				local wins = vim.api.nvim_list_wins()
				for _, w in ipairs(wins) do
					local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
					if bufname:match("NvimTree_") ~= nil then
						table.insert(tree_wins, w)
					end
					if vim.api.nvim_win_get_config(w).relative ~= "" then
						table.insert(floating_wins, w)
					end
				end
				if 1 == #wins - #floating_wins - #tree_wins then
					-- Should quit, so we close all invalid windows.
					for _, w in ipairs(tree_wins) do
						vim.api.nvim_win_close(w, true)
					end
				end
			end,
		})
		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>ee", "<cmd>NvimTreeFindFile<CR>", { desc = "Focus file explorer" }) -- toggle file explorer
		keymap.set("n", "<leader>ex", "<cmd>NvimTreeClose<CR>", { desc = "Close file explorer" }) -- toggle file explorer
		keymap.set("n", "<leader>yf", function()
			local filepath = vim.fn.expand("%:p")
			local relative_path = vim.fn.fnamemodify(filepath, ":~:.")
			vim.fn.setreg("+", relative_path)
			vim.notify("Copied path: " .. relative_path, vim.log.levels.INFO)
		end, { desc = "Copy current file's relative path" })
	end,
}

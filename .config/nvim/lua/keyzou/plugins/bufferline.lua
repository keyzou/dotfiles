return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slant",
			offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		},
	},
	after = "catppuccin",
	config = function()
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
		})

		vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>") -- next tab
		vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>") -- previous tab
	end,
}

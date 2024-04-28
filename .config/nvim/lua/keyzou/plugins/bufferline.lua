return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
	version = "*",
	config = function()
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
			options = {
				separator_style = "thin",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return icon .. count
				end,
				offsets = {
					{
						filetype = "NvimTree",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
			},
		})

		vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>") -- next tab
		vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>") -- previous tab
	end,
}

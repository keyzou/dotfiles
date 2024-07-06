return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("typescript-tools").setup({
			settings = {
				tsserver_file_preferences = {
					importModuleSpecifierPreference = "non-relative",
				},
				expose_as_code_action = "all",
				code_lens = "on",
			},
		})
	end,
}

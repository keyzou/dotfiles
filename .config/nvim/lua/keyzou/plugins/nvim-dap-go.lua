return {
	"leoluz/nvim-dap-go",
	ft = "go",
	dependencies = "mfussenegger/nvim-dap",
	config = function(_, opts)
		require("dap-go").setup(opts)

		vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<leader>du", function()
			local widgets = require("dap.ui.widgets")
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.open()
		end)

		vim.keymap.set("n", "<leader>dgt", function()
			require("dap-go").debug_test()
		end)
		vim.keymap.set("n", "<leader>dgl", function()
			require("dap-go").debug_last()
		end)
	end,
}

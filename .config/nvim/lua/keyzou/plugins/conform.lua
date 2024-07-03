return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>mp",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier", "rustywind" },
				typescriptreact = { "prettier", "rustywind" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier", "rustywind" },
				json = { "prettier" },
				yaml = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format" },
				go = { "goimports-reviser", "golines" },
			},
			format_after_save = {
				lsp_format = "fallback",
				async = true,
				timeout_ms = 1000,
			},
		})

		conform.formatters["goimports-reviser"] = function(bufnr)
			return {
				prepend_args = { "-rm-unused" },
			}
		end
	end,
}

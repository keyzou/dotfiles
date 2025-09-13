return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      emmet_language_server = {},
      ruff = {
        on_attach = function(client, bufnr_attached)
          _ = client
          -- Ruff automatic import organization.
          LazyVim.format.register({
            name = "ruff.organize_imports",
            priority = 50, -- Smaller than Conform's 100.
            primary = false, -- Conform is primary.
            format = function(bufnr)
              if bufnr == bufnr_attached then
                vim.lsp.buf.code_action({
                  context = {
                    only = { "source.organizeImports" },
                    diagnostics = {},
                  },
                  apply = true,
                })
              end
            end,
            sources = function(_)
              return { "ruff.organize_imports" } -- Dummy name.
            end,
          })
        end,
      },
    },
  },
}

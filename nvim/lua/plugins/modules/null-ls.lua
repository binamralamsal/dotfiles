return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")


    local b = null_ls.builtins

    local sources = {

      -- webdev stuff
      b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
      b.formatting.prettier.with {
        filetypes = {
          "html",
          "markdown",
          "css",
          "javascript",
          "scss",
          "sass",
          "typescript",
          "typescriptreact",
          "javascriptreact",
          "json",
        },
      }, -- so prettier works only on these filetypes

      -- Lua
      b.formatting.stylua,

      -- cpp
      b.formatting.clang_format,

      b.code_actions.eslint_d,
      b.diagnostics.eslint_d,
      b.formatting.eslint_d,
    }

    null_ls.setup {
      debug = true,
      sources = sources,
      on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
          vim.api.nvim_clear_autocmds {
            group = augroup,
            buffer = bufnr,
          }
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { bufnr = bufnr }
            end,
          })
        end
      end,
    }
  end,
}

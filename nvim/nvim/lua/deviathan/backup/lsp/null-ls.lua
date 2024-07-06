local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  debug = true,
  sources = {
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.clang_format.with({ extra_args = { "-style=file:/Users/dalelakes/.config/.clang-format" } }),
    formatting.dart_format,
    formatting.eslint_d,
    formatting.golines.with({ extra_args = { "--tab-len", "2" } }),
    formatting.ktlint,
    formatting.jq,
    --[[ formatting.prettier, ]]
    formatting.shfmt,
    formatting.stylua,
    formatting.swiftformat,
    diagnostics.flake8,
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end,
})

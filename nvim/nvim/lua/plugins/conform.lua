return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofumpt", "golines" },
      perl = { "perltidy" },
      lua = { "stylua" },
    },
  },
}

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofmt" },
      perl = { "perltidy" },
      lua = { "stylua" },
    },
  },
}

local config_home = os.getenv("HOME") .. "/.config/"
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      bash = { "shfmt" },
      cpp = { "clang-format" },
      go = { { "gofmt", "goimports" } },
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { { "prettierd", "prettier" } },
      swift = { "swiftformat" },
      toml = { "taplo" },
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
    -- Customize formatters
    formatters = {
      stylua = {
        prepend_args = {
          "--config-path",
          config_home .. "stylua/stylua.toml",
        },
      },
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      swiftformat = {
        prepend_args = { "--indent", "2" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}

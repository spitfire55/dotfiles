return {
  "akinsho/flutter-tools.nvim",
  ft = { "dart" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
    "dart-lang/dart-vim-plugin",
  },
  config = function()
    require("flutter-tools").setup({
      ui = {
        border = "rounded",
      },
      lsp = {
        color = {
          enabled = true,
        },
      },
      widget_guides = {
        enabled = true,
      },
    })
    require("telescope").load_extension("flutter")
    vim.api.nvim_set_keymap(
      "n",
      "<leader>tf",
      ":Telescope flutter commands<CR>",
      { noremap = true, silent = true, desc = "Flutter commands" }
    )
  end,
}

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  version = false,
  dependencies = "nvim-tree/nvim-web-devicons",
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<leader>cb", ":bdelete<cr>", desc = "Close Buffer" },
  },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, _)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
      always_show_bufferline = false,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
}

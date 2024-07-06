return {
  "akinsho/toggleterm.nvim",
  version = false,
  opts = {
    open_mapping = [[<c-\>]],
    direction = "float",
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
  end,
}

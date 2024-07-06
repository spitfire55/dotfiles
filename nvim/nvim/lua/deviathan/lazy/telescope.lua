return {
  "nvim-telescope/telescope.nvim",
  version = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ghassan0/telescope-glyph.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    -- Easy file switching
    {
      "<leader>,",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Buffer",
    },
    {
      "<leader>tg",
      "<cmd>Telescope glyph<cr>",
      desc = "Search for glyph",
    },
    {
      "<leader>/",
      "<cmd> Telescope live_grep<cr>",
      desc = "Live Grep",
    },
    {
      "<leader>:",
      "<cmd>Telescope command_history<cr>",
      desc = "Command History",
    },
    {
      "<leader>fb",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Buffers",
    },
  },
  config = function()
    require("telescope").load_extension("glyph")
    require("telescope").load_extension("fzf")
    require("telescope").setup({})
  end,
}

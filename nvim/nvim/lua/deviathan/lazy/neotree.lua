return {
  "nvim-neo-tree/neo-tree.nvim",
  version = false,
  cmd = "Neotree",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          dir = vim.uv.cwd(),
        })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    {
      "<leader>ge",
      function()
        require("neo-tree.command").execute({
          source = "git_status",
          toggle = true,
        })
      end,
      desc = "Git Explorer",
    },
    {
      "<leader>be",
      function()
        require("neo-tree.command").execute({
          source = "buffers",
          toggle = true,
        })
      end,
      desc = "Buffer Explorer",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        mappings = {
          ["P"] = {
            "toggle_preview",
            config = { use_float = false, use_image_nvim = true },
          },
        },
      },
    })
  end,
}

return {
  {
    "vhyrro/luarocks.nvim",
    lazy = false,
    priorit = 1000,
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("image").setup({
        backend = "kitty",
      })
    end,
  },
}

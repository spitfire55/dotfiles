return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    defaults = {
      preset = "modern",
      notify = false,
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      -- ["]"] = { group = "+next" },
      -- ["["] = { group = "+prev" },
      -- ["<leader><tab>"] = { group = "+tabs" },
      { "<leader>b", group = "+buffer" },
      -- ["<leader>c"] = { group = "+code" },
      -- ["<leader>f"] = { group = "+file/find" },
      { "<leader>g", group = "+git" },
      -- ["<leader>gh"] = { name = "+hunks" },
      -- ["<leader>q"] = { name = "+quit/session" },
      -- ["<leader>s"] = { name = "+search" },
      -- ["<leader>u"] = { name = "+ui" },
      -- ["<leader>w"] = { name = "+windows" },
      { "<leader>x", group = "+diagnostics/quickfix" },
    })
  end,
}

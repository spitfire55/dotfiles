return {
  {
    "rebelot/kanagawa.nvim",
    opts = function()
      return {
        transparent = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
                bg_p2 = "none",
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2, blend = vim.o.pumblend },
            PmenuSbar = { bg = theme.ui.bg_m1, blend = vim.o.pumblend },
            PmenuThumb = { bg = theme.ui.bg_p2, blend = vim.o.pumblend },
            LineNr = { fg = theme.ui.fg_dim, bg = theme.ui.bg_gutter },
          }
        end,
      }
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-wave",
    },
  },
}

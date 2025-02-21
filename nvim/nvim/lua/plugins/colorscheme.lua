return {
  {
    "rebelot/kanagawa.nvim",
    opts = {
      transparent = true,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
            float = {
              bg = "black",
            },
            pmenu = {
              bg = "black",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        local makeDiagnosticColor = function(color)
          local c = require("kanagawa.lib.color")
          return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
        end

        return {
          DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
          DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
          DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
          DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
        }
      end,
      --   overrides = function(colors)
      --     local theme = colors.theme
      --     return {
      --       -- NormalFloat = { bg = "none" },
      --       -- FloatBorder = { bg = "none" },
      --       -- FloatTitle = { bg = "none" },
      --
      --       -- Save an hlgroup with dark background and dimmed foreground
      --       -- so that you can use it where your still want darker windows.
      --       -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
      --       -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
      --
      --       -- Popular plugins that open floats will link to NormalFloat by default;
      --       -- set their background accordingly if you wish to keep them dark and borderless
      --       -- LazyNormal = { bg = "black", fg = theme.ui.fg_dim },
      --       -- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
      --     }
      --   end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-wave",
    },
  },
}

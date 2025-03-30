return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    dependencies = {
      "stevearc/dressing.nvim",
    },
    opts = function(_, opts)
      local os = vim.loop.os_uname().sysname
      -- Check if running on macOS
      if os == "Darwin" then
        opts.provider = "lmstudio"
        opts.vendors = {
          lmstudio = {
            __inherited_from = "openai",
            api_key_name = "",
            endpoint = "http://127.0.0.1:1234/v1",
            model = "qwen2.5-coder-32b-instruct",
          },
        }
        -- elseif os == "Linux" then
      end

      opts.windows = {
        width = 35,
      }
      -- Default configuration
      opts.hints = { enabled = false }

      -- File selector configuration
      --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string
      opts.file_selector = {
        provider = "fzf",
        provider_opts = {},
      }

      -- Blink.cmp integration
      -- LSP score_offset is typically 60
      opts.providers = {
        avante_commands = {
          name = "avante_commands",
          module = "blink.compat.source",
          score_offset = 90, -- show at a higher priority than lsp
          opts = {},
        },
        avante_files = {
          name = "avante_files",
          module = "blink.compat.source",
          score_offset = 100, -- show at a higher priority than lsp
          opts = {},
        },
        avante_mentions = {
          name = "avante_mentions",
          module = "blink.compat.source",
          score_offset = 1000, -- show at a higher priority than lsp
          opts = {},
        },
      }

      opts.compat = {
        "avante_commands",
        "avante_mentions",
        "avante_files",
      }
    end,
    build = "make",
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    opts = {
      input = { enabled = false },
      select = { enabled = false },
    },
  },
  {
    "saghen/blink.compat",
    lazy = true,
    opts = {},
    config = function()
      -- monkeypatch cmp.ConfirmBehavior for Avante
      require("cmp").ConfirmBehavior = {
        Insert = "insert",
        Replace = "replace",
      }
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    ft = function(_, ft)
      vim.list_extend(ft, { "Avante" })
    end,
    opts = function(_, opts)
      opts.file_types = vim.list_extend(opts.file_types or {}, { "Avante" })
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>a", group = "ai" },
      },
    },
  },
}

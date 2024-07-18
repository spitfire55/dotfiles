return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
    },
    keys = {
      {
        "gq",
        vim.lsp.buf.code_action,
        desc = "Code Action",
      },
      {
        "gh",
        vim.lsp.buf.hover,
        desc = "Hover",
      },
      {
        "gd",
        "<cmd>lua vim.lsp.buf.definition()<cr>",
        desc = "Goto Definition",
      },
      {
        "gr",
        "<cmd>lua vim.lsp.buf.references()<cr>",
        desc = "Goto References",
      },
      {
        "gI",
        "<cmd>lua vim.lsp.buf.implementation()<cr>",
        desc = "Goto Implementation",
      },
    },
    config = function()
      local cmp = require("cmp")
      local cmp_lsp = require("cmp_nvim_lsp")
      local lspconfig = require("lspconfig")
      local lspkind = require("lspkind")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )

      require("fidget").setup({})
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "denols",
          "eslint",
          "html",
          "jsonls",
          "gopls",
          "lua_ls",
          "marksman",
          "ruff",
          "tsserver",
          "zls",
        },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  runtime = { version = "Lua 5.4" },
                  diagnostics = {
                    globals = {
                      "vim",
                      "it",
                      "describe",
                      "before_each",
                      "after_each",
                    },
                  },
                },
              },
            })
          end,
          ["denols"] = function()
            lspconfig.denols.setup({
              capabilities = capabilities,
              root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
            })
          end,
          ["tsserver"] = function()
            lspconfig.tsserver.setup({
              capabilities = capabilities,
              root_dir = lspconfig.util.root_pattern("package.json"),
              single_file_support = false,
            })
          end,
        },
      })
      lspconfig.clangd.setup {
        capabilities = capabilities,
      }

      lspconfig.zls.setup {
        cmd = { '/home/dlakes/.local/share/nvim/mason/bin/zls' },
        capabilities = capabilities,
      }

      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local luasnip = require("luasnip")

      cmp.setup({
        formatting = {
          expandable_indicator = true,
          fields = {
            "abbr",
            "kind",
            "menu",
          },
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_chat = "...",    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
          ["<CR>"] = cmp.mapping.confirm({
            select = false,
          }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        sources = cmp.config.sources({
          { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })

      -- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      --   callback = function()
      --     local opts = {
      --       focusable = false,
      --       close_events = {
      --         "BufLeave",
      --         "CursorMoved",
      --         "InsertEnter",
      --         "FocusLost",
      --       },
      --       border = "rounded",
      --       source = "always",
      --       prefix = " ",
      --       scope = "cursor",
      --     }
      --     vim.diagnostic.open_float(nil, opts)
      --   end,
      -- })
      --
      vim.diagnostic.config({
        -- update_in_insert = true,
        virtual_text = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "●",
            [vim.diagnostic.severity.WARN] = "●",
            [vim.diagnostic.severity.INFO] = "●",
            [vim.diagnostic.severity.HINT] = "●",
          },
        },
        -- float = {
        --   focusable = false,
        --   style = "minimal",
        --   border = "rounded",
        --   source = "always",
        --   header = "",
        --   prefix = "",
        -- },
      })
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function()
      require("tiny-inline-diagnostic").setup()
    end,
  },
}

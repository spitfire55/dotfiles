-- Automatically install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lazy.nvim requires setting leader keys before it's loaded
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

-- Install your plugins here
return lazy.setup({
  -- My plugins here
  "folke/lazy.nvim", -- Have lazy manage itself
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins

  -- colorscheme plugin
  "shaunsingh/nord.nvim", -- Nord color scheme
  "Mofiqul/dracula.nvim", -- Dracula color scheme
  { "catppuccin/nvim", name = "catppuccin" }, -- Catpuccin color scheme

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
  "jay-babu/mason-null-ls.nvim", -- bring Mason and null-ls together
  "jose-elias-alvarez/typescript.nvim", -- for typescript goodness
  "ray-x/lsp_signature.nvim",

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_browser = "firefox"
      vim.g.mkdp_theme = "light"
    end,
  },

  -- Telescope
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-media-files.nvim",

  -- Trouble
  "folke/trouble.nvim",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "p00f/nvim-ts-rainbow",

  -- Autopairs
  "windwp/nvim-autopairs",

  -- Comments
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Git
  "lewis6991/gitsigns.nvim",

  -- NvimTree
  { "kyazdani42/nvim-tree.lua", commit = "8b8d457" },
  "kyazdani42/nvim-web-devicons",

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    after = "catppuccin",
    config = function()
      require("bufferline").setup({
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
      })
    end,
  },
  "moll/vim-bbye",

  -- Lualine
  "nvim-lualine/lualine.nvim",

  -- Toggleterm
  "akinsho/toggleterm.nvim",

  -- Debugging
  "mfussenegger/nvim-dap",

  -- Keybindings
  "folke/which-key.nvim",

  -- Flutter + Dart
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = {
      flutter_lookup_cmd = "asdf where flutter",
      lsp = {
        color = { -- show the derived colours for dart variables
          enabled = true,
        },
      },
    },
  },
  "Neevash/awesome-flutter-snippets",
  "RobertBrunhage/flutter-riverpod-snippets",

  -- Fastlane
  "bifrostyyy/vim-fastlane",

  -- GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- Tmux
  "christoomey/vim-tmux-navigator",
})

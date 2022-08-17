local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

  -- colorscheme plugin
  use("shaunsingh/nord.nvim") -- Nord color scheme

  -- cmp plugins
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use("neovim/nvim-lspconfig") -- enable LSP
  use("williamboman/nvim-lsp-installer")
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  use("jose-elias-alvarez/typescript.nvim") -- for typescript goodness
  use("ray-x/lsp_signature.nvim")

  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_browser = "firefox"
      vim.g.mkdp_theme = "light"
    end,
  })

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-media-files.nvim")

  -- Trouble
  use("folke/trouble.nvim")

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("p00f/nvim-ts-rainbow")

  -- Autopairs
  use("windwp/nvim-autopairs")

  -- Comments
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Git
  use("lewis6991/gitsigns.nvim")

  -- NvimTree
  use("kyazdani42/nvim-tree.lua")
  use("kyazdani42/nvim-web-devicons")

  -- Bufferline
  use("akinsho/bufferline.nvim")
  use("moll/vim-bbye")

  -- Lualine
  use("nvim-lualine/lualine.nvim")

  -- Toggleterm
  use("akinsho/toggleterm.nvim")

  -- Debugging
  use("mfussenegger/nvim-dap")

  -- Keybindings
  use("folke/which-key.nvim")

  -- Dart
  use("dart-lang/dart-vim-plugin")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

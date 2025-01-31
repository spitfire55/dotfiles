-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.wrap = true
opt.breakindent = true
opt.showbreak = "↳ "
opt.conceallevel = 0
opt.colorcolumn = "100"
vim.g.root_spec = { "cwd" }

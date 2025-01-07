-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local options = { noremap = true, silent = true }
-- Move selected lines down
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", options)
-- Move selected lines up
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", options)

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

------------
-- Normal --
------------
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Delete, not cut
keymap("n", "dd", '"_dd', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescop --
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>tff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>tfp", "<cmd>lua require'telescope.builtin'.find_files({cwd='$HOME/Projects'})<cr>", opts)
keymap("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>tw", "<cmd>Telescope grep_string<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- GitSigns Navigation
keymap("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
keymap("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

-- GitSigns Actions
keymap("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)
keymap("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>hS", ":Gitsigns stage_buffer<CR>", opts)
keymap("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", opts)
keymap("n", "<leader>hR", ":Gitsigns reset_buffer<CR>", opts)
keymap("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>hb", "<cmd> lua require'gitsigns'.blame_line({full=true})<cr>", opts)
keymap("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", opts)
keymap("n", "<leader>hd", ":Gitsigns diffthis<CR>", opts)
keymap("n", "<leader>hD", "<cmd> lua require'gitsigns'.diffthis('~')<cr>", opts)
keymap("n", "<leader>td", ":Gitsigns toggle_deleted<CR>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)

-- Null-LS Formatting
keymap("n", "<leader>ff", ":Format<cr>", opts)

-- Bufferline
keymap("n", "<leader>cb", ":BufferLinePickClose<cr>", opts)

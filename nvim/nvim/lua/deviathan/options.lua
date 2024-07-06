local options = {
  -- :help options
  backup = false, -- creates a backup file
  hlsearch = false,
  incsearch = true, -- use incremental search
  expandtab = true, -- convert tabs to spaces
  smartindent = true, -- make indenting smarter again
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  softtabstop = 2,
  swapfile = false, -- dont create a swapfile
  updatetime = 50, -- Make swapfile updates happen more often
  guicursor = "",
  termguicolors = true, -- set term gui colors (most terminals support this)
  undodir = os.getenv("HOME") .. "/.vim/undodir", -- Specify persistent undo location
  undofile = true, -- enable persistent undo
  number = true, -- set numbered lines
  relativenumber = true, -- Use relative line numbers
  numberwidth = 2, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false,
  scrolloff = 8, -- is one of my fav
  wrapmargin = 0,
  colorcolumn = "80",
  clipboard = "unnamedplus", -- use the system clipboard
}

vim.opt.isfname:append("@-@") -- Support files with '@' in path

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.python_host_prog = vim.fn.expand("~/.asdf/shims/python")
vim.g.python3_host_prog = vim.fn.expand("~/.asdf/shims/python3")

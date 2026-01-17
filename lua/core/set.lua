-- Line numbers, relative
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.signcolumn = "no"

-- Ignore case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000

-- Tab settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.g.r_indent_align_args = 0

-- Highlight search hits
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Better colors
vim.opt.termguicolors = true

-- Always have 8 columns at bottom
vim.opt.scrolloff = 15
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Fast
vim.opt.updatetime = 50

-- Column at 80 characters
vim.opt.colorcolumn = "80"
vim.lazyredraw = true

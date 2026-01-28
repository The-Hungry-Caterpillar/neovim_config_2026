-- Line numbers, relative
vim.opt.nu = true
vim.opt.relativenumber = true

-- Line wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Ignore case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000

-- Tab settings
vim.cmd("filetype plugin indent on")
vim.opt.smartindent = false
vim.opt.cindent = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
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

-- Toggle background
vim.keymap.set("n", "<leader>b", function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end, { desc = "Toggle background (light/dark)" })


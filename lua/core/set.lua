-- Line numbers, relative
vim.opt.nu = true
vim.opt.relativenumber = true

-- Enable WSL copy to clipboard
vim.g.clipboard = {
  name = 'win32yank',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = {'powershell.exe', '-c', '[Console]::Out.Write($(Get-Clipboard -Raw))'},
    ['*'] = {'powershell.exe', '-c', '[Console]::Out.Write($(Get-Clipboard -Raw))'},
  },
  cache_enabled = 0,
}

-- Tabline
-- vim.opt.showtabline = 0 -- Never show
-- vim.opt.showtabline = 1 -- Only if multiple buffers
vim.opt.showtabline = 2 -- Even if just one buffer

vim.opt.scrolloff = 999

-- Last key pressed
vim.opt.showcmd = false

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

-- Remove markdown error highlighting
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "markdownError", { link = "Normal" })
  end,
})

-- No statusline for R terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function(args)
    local bufname = vim.api.nvim_buf_get_name(args.buf)

    -- Match R.nvim terminals
    if bufname:match("^term://") and bufname:match("R %-%-quiet") then
      vim.schedule(function()
        local win = vim.fn.bufwinid(args.buf)
        if win ~= -1 then
          -- window-local override
          vim.api.nvim_set_option_value("statusline", " ", { win = win })
        end
      end)
    end
  end,
})

-- Close certain windows with "q"
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qf", "help", "man", "lspinfo" },
  callback = function(event)
    vim.keymap.set("n", "q", "<cmd>close<CR>", {
      buffer = event.buf,
      silent = true,
      desc = "Close window",

    })
  end,
})

-- vim.cmd.colorscheme("industry")

-- -- Override tabline highlights for every colorscheme load
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = function()
--     -- Base tabline groups
--     vim.api.nvim_set_hl(0, "TabLine", { link = "Normal" })
--     vim.api.nvim_set_hl(0, "TabLineFill", { link = "Normal" })
--     vim.api.nvim_set_hl(0, "TabLineSel", { link = "Visual" })
--
--     -- MiniTabline groups
--     vim.api.nvim_set_hl(0, "MiniTablineCurrent", { link = "TabLineSel" })
--     vim.api.nvim_set_hl(0, "MiniTablineVisible", { link = "TabLine" })
--     vim.api.nvim_set_hl(0, "MiniTablineHidden", { link = "TabLine" })
--     vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { link = "TabLineSel" })
--     vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", { link = "TabLine" })
--     vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", { link = "TabLine" })
--     vim.api.nvim_set_hl(0, "MiniTablineFill", { link = "TabLineFill" })
--     vim.api.nvim_set_hl(0, "MiniTablineTabpagesection", { link = "TabLine" })
--   end,
-- })

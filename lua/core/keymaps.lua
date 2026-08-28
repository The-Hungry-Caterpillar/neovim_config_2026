-------------------------------------------------------------------------------
-- Keymaps
-------------------------------------------------------------------------------

local map = vim.keymap.set

-- Small helpers to enforce descriptions
local function nmap(lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  if opts.silent == nil then opts.silent = true end
  map("n", lhs, rhs, opts)
end

local function imap(lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  map("i", lhs, rhs, opts)
end

local function vmap(lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  map("v", lhs, rhs, opts)
end

local function tmap(lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  map("t", lhs, rhs, opts)
end

-- Basics ---------------------------------------------------------------------

imap("jk", "<Esc>", "Escape insert mode")
nmap("<leader>ww", "<cmd>wa<CR>", "Save file")
nmap("<leader>wq", "<cmd>wqa<CR>", "Save file and quit")
nmap("<leader>qq", "<cmd>qa!<CR>", "Force quit")

-- Move by visual lines when wrapping
vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })
vim.keymap.set("v", "j", "gj", { silent = true })
vim.keymap.set("v", "k", "gk", { silent = true })

-- Move selected lines up/down (visual mode)
vmap("J", ":m '>+1<CR>gv=gv", "Move selection down")
vmap("K", ":m '<-2<CR>gv=gv", "Move selection up")

-- Keep cursor centered when half-page jumping
nmap("<C-d>", "<C-d>zz", "Half-page down (center)")
nmap("<C-u>", "<C-u>zz", "Half-page up (center)")

-- R: insert pipe operator
imap("jj", " |>", "Insert pipe (R)")

-- Keep cursor centered when moving through search results
nmap("N", "Nzzzv", "Search previous (center)")
nmap("n", "nzzzv", "Search next (center)")

-- Move through buffers
-- nmap("<leader>l", ":bnext<CR>", "Next buffer")
-- nmap("<leader>h", ":bprevious<CR>", "Previous buffer")
nmap("L", ":bnext<CR>", "Next buffer")
nmap("H", ":bprevious<CR>", "Previous buffer")

-- Faster terminal exit
tmap("<Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- Quick line wrap
nmap("K", "gqq", "Wrap line")

-- Theme switcher
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    vim.keymap.set(
      "n", "<leader>c", "<cmd>ThemeSwitch<cr>",
      { desc = "Switch theme", silent = true }
    )
  end,
})


-- Split / window management --------------------------------------------------

-- Create a visible group for clue systems
nmap("<leader>s", "", "+split / window")

-- Splits
nmap("<leader>ss", "<C-w>s", "Split: horizontal")
nmap("<leader>sv", "<C-w>v", "Split: vertical")

-- Close current window
nmap("<leader>sd", "<C-w>c", "Split: close window")

-- Move focus
nmap("<leader>sh", "<C-w>h", "Split: focus left")
nmap("<leader>sj", "<C-w>j", "Split: focus down")
nmap("<leader>sk", "<C-w>k", "Split: focus up")
nmap("<leader>sl", "<C-w>l", "Split: focus right")

-- Move window position
nmap("<leader>sH", "<C-w>H", "Split: move window left")
nmap("<leader>sJ", "<C-w>J", "Split: move window down")
nmap("<leader>sK", "<C-w>K", "Split: move window up")
nmap("<leader>sL", "<C-w>L", "Split: move window right")

-- Resize
nmap("<leader>s<Left>",  "<C-w><", "Split: narrower")
nmap("<leader>s<Right>", "<C-w>>", "Split: wider")
nmap("<leader>s<Up>",    "<C-w>+", "Split: taller")
nmap("<leader>s<Down>",  "<C-w>-", "Split: shorter")

-- Equalize
nmap("<leader>s=", "<C-w>=", "Split: equalize")


-- Editing helpers ------------------------------------------------------------

-- Insert a divider line to 79 columns with Ctrl+L (insert mode)
imap("<C-l>", function()
  local col = vim.fn.col(".")
  local width = 80
  if col < width then
    vim.api.nvim_put({ string.rep("-", width - col + 1) }, "c", true, true)
  end
end, "Insert divider to 80 columns")

-- j/k move through wrapped display lines when no count is given
nmap("j", function()
  return vim.v.count == 0 and "gj" or "j"
end, "Down (screen line if wrapped)", { expr = true, silent = true })

nmap("k", function()
  return vim.v.count == 0 and "gk" or "k"
end, "Up (screen line if wrapped)", { expr = true, silent = true })

-- Toggle background between light and dark
vim.api.nvim_create_user_command('ToggleBackground', function()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end, {})
vim.keymap.set(
  'n', '<leader>bd', '<cmd>ToggleBackground<cr>',
  { desc = 'Toggle background' }
)


-- Git / tools ----------------------------------------------------------------

-- Lazygit in a floating terminal
nmap("<leader>gg", function()
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.9)
  local height = math.floor(vim.o.lines * 0.9)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = (vim.o.lines - height) / 2,
    col = (vim.o.columns - width) / 2,
    style = "minimal",
    border = "rounded",
  })

  vim.fn.termopen("lazygit")
  vim.cmd("startinsert")

  vim.api.nvim_create_autocmd("TermClose", {
    buffer = buf,
    once = true,
    callback = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })
end, "LazyGit")

-- mini.nvim integrations  -----------------------------------------------------

vim.keymap.set("n", "<leader>e", function()
  MiniFiles.open(vim.fn.getcwd(), false)
end, { desc = "Open MiniFiles at cwd" })

nmap("<leader>n", function()
  -- require("mini.files").open(vim.env.HOME .. "/notes/running_notes.md")
  vim.cmd.edit(vim.env.HOME .. "/notes/running_notes.md")
  vim.opt.number = not vim.opt.number:get()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, "Notes")

nmap("<leader>d", function()
  require("mini.bufremove").delete()
end, "Delete buffer")


-- Tmux navigator -------------------------------------------------------------

nmap("<C-h>", "<cmd>TmuxNavigateLeft<cr>", "Tmux: focus left", { silent = true })
nmap("<C-j>", "<cmd>TmuxNavigateDown<cr>", "Tmux: focus down", { silent = true })
nmap("<C-k>", "<cmd>TmuxNavigateUp<cr>", "Tmux: focus up", { silent = true })
nmap("<C-l>", "<cmd>TmuxNavigateRight<cr>", "Tmux: focus right", { silent = true })
nmap("<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", "Tmux: previous pane", { silent = true })


-- LSP ------------------------------------------------------------------------

vim.keymap.set("n", "<leader>xj", vim.diagnostic.goto_next, {
  desc = "Next diagnostic",
})

vim.keymap.set("n", "<leader>xk", vim.diagnostic.goto_prev, {
  desc = "Previous diagnostic",
})

vim.keymap.set("n", "<leader>xd", vim.diagnostic.setloclist, {
  desc = "Diagnostics list",
})

vim.keymap.set("n", "<leader>xl", function()
  vim.diagnostic.open_float({
    border = "rounded",
    source = "if_many",
  })
end, { desc = "Line diagnostics" })

vim.keymap.set("n", "<leader>xf", function()
  vim.lsp.buf.hover({
    border = "rounded",
  })
end, { desc = "Function information", })

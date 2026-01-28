-------------------------------------------------------------------------------
-- Keymaps
-------------------------------------------------------------------------------

local map = vim.keymap.set

-- Small helpers to enforce descriptions
local function nmap(lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
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

nmap("<leader>fv", vim.cmd.Ex, "Explorer: open netrw")
imap("jk", "<Esc>", "Escape insert mode")
nmap("<leader>w", vim.cmd.w, "Save file")

-- Move selected lines up/down (visual mode)
vmap("J", ":m '>+1<CR>gv=gv", "Move selection down")
vmap("K", ":m '<-2<CR>gv=gv", "Move selection up")

-- Keep cursor centered when half-page jumping
nmap("<C-d>", "<C-d>zz", "Half-page down (center)")
nmap("<C-u>", "<C-u>zz", "Half-page up (center)")

-- R: insert pipe operator
imap("jj", " %>%", "Insert %>% pipe")

-- Keep cursor centered when moving through search results
nmap("N", "Nzzzv", "Search previous (center)")
nmap("n", "nzzzv", "Search next (center)")

-- Create windows easier, tmux-like
nmap("w|", "<C-w>v", "Split vertical")
nmap("w_", "<C-w>s", "Split horizontal")

-- Move through buffers
nmap("L", ":bnext<CR>", "Next buffer")
nmap("H", ":bprevious<CR>", "Previous buffer")

-- Delete buffer but keep window
nmap("<leader>d", ":<C-U>bprevious <bar> bdelete #<CR>", "Delete buffer (keep window)")

-- Faster terminal exit
tmap("<Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- Lazy
nmap("<leader>l", "<cmd>Lazy<cr>", "Lazy.nvim: plugin manager")


-- Editing helpers ------------------------------------------------------------

-- Insert a divider line to 79 columns with Ctrl+L (insert mode)
imap("<C-l>", function()
  local col = vim.fn.col(".")
  local width = 79
  if col < width then
    vim.api.nvim_put({ string.rep("-", width - col + 1) }, "c", true, true)
  end
end, "Insert divider to 79 columns")

-- j/k move through wrapped display lines when no count is given
nmap("j", function()
  return vim.v.count == 0 and "gj" or "j"
end, "Down (screen line if wrapped)", { expr = true, silent = true })

nmap("k", function()
  return vim.v.count == 0 and "gk" or "k"
end, "Up (screen line if wrapped)", { expr = true, silent = true })

-- Git / tools ----------------------------------------------------------------

-- Lazygit in a floating terminal
nmap("<leader>g", function()
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
end, "LazyGit (float)")

-- mini.nvim integrations  -----------------------------------------------------

nmap("<leader>e", function()
  require("mini.files").open(vim.fn.getcwd())
end, "Explorer (mini.files)")

nmap("<leader>n", function()
  require("mini.files").open(vim.env.HOME .. "/notes")
end, "Notes Explorer")

nmap("<leader>bd", function()
  require("mini.bufremove").delete()
end, "Delete buffer (mini.bufremove)")

-- Tmux navigator -------------------------------------------------------------

nmap("<C-h>", "<cmd>TmuxNavigateLeft<cr>", "Tmux: focus left", { silent = true })
nmap("<C-j>", "<cmd>TmuxNavigateDown<cr>", "Tmux: focus down", { silent = true })
nmap("<C-k>", "<cmd>TmuxNavigateUp<cr>", "Tmux: focus up", { silent = true })
nmap("<C-l>", "<cmd>TmuxNavigateRight<cr>", "Tmux: focus right", { silent = true })
nmap("<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", "Tmux: previous pane", { silent = true })

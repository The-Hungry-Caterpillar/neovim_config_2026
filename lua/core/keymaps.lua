local map = vim.keymap.set

-- <leader>fv to exit file and go back to explorer
map("n", "<leader>fv", vim.cmd.Ex)

-- jk for quick esc to normal mode 
map("i", "jk", "<Esc>")

-- <leader>w to save changes
map("n", "<leader>w", vim.cmd.w)

-- move lines in view mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in middle when moving up/down half page
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- pipe shortcut for R
map("i", "jj", "%>%")

-- keep cursor in middle when jumping through search hits
map("n", "N", "Nzzzv")
map("n", "n", "nzzzv")

-- -- yank to keyboard
-- map("n", "<leader>y", "\"+y")
-- map("n", "<leader>Y", "\"+Y")
-- map("v", "<leader>y", "\"+y")

-- Create windows easier, tmux-like
map("n", "w|", "<C-w>v")
map("n", "w_", "<C-w>s")

-- Move through buffers more better
map("n", "L", ":bnext<CR>")
map("n", "H", ":bprevious<CR>")
-- <leader>bd to delete buffer but not window
map("n", "<leader>d", ":<C-U>bprevious <bar> bdelete #<CR>")
-- faster terminal exit
map("t", "<Esc>", "<C-\\><C-n>")

-- Insert a header line with ctrl+l
vim.keymap.set("i", "<C-l>", function()
  local col = vim.fn.col('.')
  local width = 79
  if col < width then
    vim.api.nvim_put({ string.rep("-", width - col + 1) }, "c", true, true)
  end
end, { desc = "Insert divider to 79 columns" })

-- Lazygit integration --------------------------------------------------------
vim.keymap.set("n", "<leader>g", function()
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

  -- close window when lazygit exits
  vim.api.nvim_create_autocmd("TermClose", {
    buffer = buf,
    once = true,
    callback = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })
end, { desc = "LazyGit (float)" })


-- mini.files ----------------------------------------------------------------

-- opens file tree
vim.keymap.set("n", "<leader>e", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0))
end, { desc = "Explorer (mini.files)" })

-- opens notes directory
vim.keymap.set("n", "<leader>n", function()
  require("mini.files").open(vim.env.HOME .. "/notes")
end, { desc = "Notes Explorer" })

-- mini.bufremove ------------------------------------------------------------
vim.keymap.set("n", "<leader>bd", function()
  require("mini.bufremove").delete()
end, { desc = "Delete buffer" })

-- tmux navigator ------------------------------------------------------------
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })
vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { silent = true })

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

-- mini.files
vim.keymap.set("n", "<leader>e", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0))
end, { desc = "Explorer (mini.files)" })

-- mini.bufremove
vim.keymap.set("n", "<leader>bd", function()
  require("mini.bufremove").delete()
end, { desc = "Delete buffer" })


-- tmux navigator
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })
vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { silent = true })

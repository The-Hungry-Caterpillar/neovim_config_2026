local terminal_buf = nil
local terminal_win = nil

local function toggle_terminal()
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_close(terminal_win, true)
    terminal_win = nil
    return
  end

  if not terminal_buf or not vim.api.nvim_buf_is_valid(terminal_buf) then
    terminal_buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_buf_call(terminal_buf, function()
      vim.fn.termopen(vim.o.shell)
    end)
  end

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  terminal_win = vim.api.nvim_open_win(terminal_buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal",
    border = "rounded",
  })

  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>tt", toggle_terminal, {
  desc = "Toggle terminal",
})

vim.keymap.set("t", "<Esc>", function()
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_close(terminal_win, true)
    terminal_win = nil
  end
end, {
  desc = "Hide terminal",
})

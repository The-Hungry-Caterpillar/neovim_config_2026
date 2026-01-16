return {
  "Mofiqul/dracula.nvim",
  lazy = false,      -- load immediately
  priority = 1000,   -- before other UI plugins
  config = function()
    vim.cmd.colorscheme("dracula")
  end,
}

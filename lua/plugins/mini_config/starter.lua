local starter = require("mini.starter")

starter.setup({
  evaluate_single = false,

  footer = "",

  items = {
    starter.sections.builtin_actions(),
    starter.sections.recent_files(5, true),
    {
      name = "Switch theme",
      action = "ThemeSwitch",
      section = "Theme",
    },
  },

  content_hooks = {
    starter.gen_hook.adding_bullet(" "),
    starter.gen_hook.aligning("center", "center"),
  },
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniStarterOpened",
  callback = function()
    local opts = { buffer = true, silent = true }
    local ms = _G.MiniStarter
    vim.keymap.set("n", "j", function() ms.update_current_item("next") end, opts)
    vim.keymap.set("n", "k", function() ms.update_current_item("prev") end, opts)
    vim.keymap.set("n", "h", function() ms.update_current_item("prev") end, opts)
    vim.keymap.set("n", "l", function() ms.update_current_item("next") end, opts)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniStarterOpened",
  callback = function()
    vim.bo.buflisted = true
  end,
})

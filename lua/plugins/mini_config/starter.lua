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

-- Open Starter on `nvim` (no args) and `nvim .` (directory arg)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local argc = vim.fn.argc()

    -- open on `nvim` or `nvim <dir>`
    if argc == 0 or (argc == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1) then
      if argc == 1 then
        vim.cmd("cd " .. vim.fn.fnameescape(vim.fn.argv(0)))
      end

      -- make sure mini.starter is actually loaded, then open it
      local ok, starter = pcall(require, "mini.starter")
      if ok then
        starter.open()
      end
    end
  end,
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

-- vim.opt.background = "light"
-- vim.cmd.colorscheme("minischeme")

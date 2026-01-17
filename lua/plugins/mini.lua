return {
  "echasnovski/mini.nvim",
  version = false, -- always use latest
  config = function()
    require("mini.files").setup({
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
    })

    -- Commenting: gc / gcc, respects treesitter
    require("mini.comment").setup({
      options = {
        custom_commentstring = nil, -- let treesitter decide
      },
    })

    -- Autopairs: minimal, predictable
    require("mini.pairs").setup({
      modes = { insert = true, command = false, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    })

    -- Statusline: clean, readable, no icons required
    require("mini.statusline").setup({
      use_icons = false, -- safer across fonts/terminals
      set_vim_settings = true,
    })

    -- Buffer removal without killing windows
    require("mini.bufremove").setup({
      silent = true,
    })

    -- Tabs
    require("mini.tabline").setup()

    -- Mini fuzzy finder ---------------------------------------------------
    require("mini.pick").setup()
    vim.keymap.set("n", "<leader><space>", function()
      require("mini.pick").builtin.files()
    end, { desc = "Fuzzy find files" })

    -- Indent scope --------------------------------------------------------
    require("mini.indentscope").setup({
      symbol = "▏",
      -- symbol = "·",
      options = { try_as_border = true },
      draw = {
        delay = 10,
        animation = require("mini.indentscope").gen_animation.none(),
      },
    })

    -- -- Splash page ------------------------------------------------------
    -- local starter = require("mini.starter")
    -- starter.setup({
    --   evaluate_single = true,
    --
    --   header = table.concat({
    --     "┌──────────────────────────┐",
    --     "│        Neovim            │",
    --     "│     calm & focused       │",
    --     "└──────────────────────────┘",
    --     "",
    --   }, "\n"),
    --
    --   items = {
    --     -- Built-in sections
    --     starter.sections.builtin_actions(),
    --     starter.sections.recent_files(5, true),
    --
    --     -- Custom items
    --     {
    --       name = "Find file",
    --       action = function() require("mini.pick").builtin.files() end,
    --       section = "Pick",
    --     },
    --     {
    --       name = "Live grep",
    --       action = function() require("mini.pick").builtin.grep_live() end,
    --       section = "Pick",
    --     },
    --     {
    --       name = "Switch theme",
    --       action = "ThemeSwitch",
    --       section = "Theme",
    --     },
    --     {
    --       name = "Edit config",
    --       action = "edit " .. vim.fn.stdpath("config") .. "/init.lua",
    --       section = "Config",
    --     },
    --   },
    --
    --   content_hooks = {
    --     starter.gen_hook.adding_bullet("• "),
    --     starter.gen_hook.aligning("center", "center"),
    --   },
    --
    -- })
    --
    -- -- Open Starter on `nvim` (no args) and `nvim .` (directory arg)
    -- vim.api.nvim_create_autocmd("VimEnter", {
    --   callback = function()
    --     local argc = vim.fn.argc()
    --
    --     -- open on `nvim` or `nvim <dir>`
    --     if argc == 0 or (argc == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1) then
    --       if argc == 1 then
    --         vim.cmd("cd " .. vim.fn.fnameescape(vim.fn.argv(0)))
    --       end
    --
    --       -- make sure mini.starter is actually loaded, then open it
    --       local ok, starter = pcall(require, "mini.starter")
    --       if ok then
    --         starter.open()
    --       end
    --     end
    --   end,
    -- })
    --
    -- vim.api.nvim_create_autocmd("User", {
    --   pattern = "MiniStarterOpened",
    --   callback = function()
    --     local opts = { buffer = true, silent = true }
    --     local ms = _G.MiniStarter
    --
    --     vim.keymap.set("n", "j", function() ms.update_current_item("next") end, opts)
    --     vim.keymap.set("n", "k", function() ms.update_current_item("prev") end, opts)
    --     vim.keymap.set("n", "h", function() ms.update_current_item("prev") end, opts)
    --     vim.keymap.set("n", "l", function() ms.update_current_item("next") end, opts)
    --   end,
    -- })
    --
  end,
}


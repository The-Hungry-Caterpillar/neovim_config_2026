return {
  "echasnovski/mini.nvim",
  version = false, -- always use latest
  config = function()
    -- Commenting: gc / gcc, respects treesitter
    require("mini.comment").setup({
      options = {
        custom_commentstring = nil, -- let treesitter decide
      },
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
    
    -- Icons
    require("mini.icons").setup()

    -- Animate ----------------------------------------------------------------
    local animate = require("mini.animate")
    animate.setup({
      cursor = {
        enable = true,
        timing = animate.gen_timing.linear({ duration = 80, unit = "total" }),
      },
      scroll = {
        enable = true,
        timing = animate.gen_timing.linear({ duration = 120, unit = "total" }),
      },
      resize = {
        enable = true,
        timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
      },
      open = { enable = false },
      close = { enable = false },
    })


    -- Autopairs --------------------------------------------------------------
    require("mini.pairs").setup({
      modes = { insert = true, command = false, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    })



    -- Mini-files--------------------------------------------------------------
    require("mini.files").setup({
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
    })

    -- Mini fuzzy finder ------------------------------------------------------
    require("mini.pick").setup()
    vim.keymap.set("n", "<leader><space>", function()
      require("mini.pick").builtin.files()
    end, { desc = "Fuzzy find files" })

    -- Indent scope -----------------------------------------------------------
    require("mini.indentscope").setup({
      symbol = "▏",
      -- symbol = "·",
      options = { try_as_border = true },
      draw = {
        delay = 10,
        animation = require("mini.indentscope").gen_animation.none(),
      },
    })

    -- Splash page ------------------------------------------------------------
    local starter = require("mini.starter")

    local function read_lines(path)
      local lines = vim.fn.readfile(path)
      return table.concat(lines, "\n")
    end

    starter.setup({
      evaluate_single = false,

      footer = function()
        local w = vim.o.columns
        local base = vim.fn.stdpath("config") .. "/ascii/"

        if w > 90 then
          return read_lines(base .. "dragon.txt")
        else
          return read_lines(base .. "calm.txt")
        end
      end,

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

  end,
}


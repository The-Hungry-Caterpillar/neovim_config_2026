return {
  "echasnovski/mini.nvim",
  version = false, -- always use latest
  config = function()

    ---------------------------------------------------------------------------
    -- Commenting
    require("mini.comment").setup({
      options = {
        custom_commentstring = nil, -- let treesitter decide
      },
    })

    ---------------------------------------------------------------------------
    require("mini.align").setup()

    ---------------------------------------------------------------------------
    -- Statusline
    require("mini.statusline").setup({
      use_icons = true, -- safer across fonts/terminals
      set_vim_settings = true,
    })

    ---------------------------------------------------------------------------
    -- Buffer removal without killing windows
    require("mini.bufremove").setup({
      silent = true,
    })

    ---------------------------------------------------------------------------
    -- Tabs
    if vim.opt.showtabline:get() > 0 then
      require("mini.tabline").setup()
    end

    ---------------------------------------------------------------------------
    -- Snippets
    local snippets = require("mini.snippets")

    snippets.setup({
      snippets = {
        {
          prefix = "head",
          body = {
            "# ------------------------------------------------------------------------------",
            "# ${1:Insert here}",
            "# ------------------------------------------------------------------------------",
            "${0}",
          },
          desc = "Section divider",
        },

        {
          prefix = "png",
          body = {
            'png(',
            '   filename = "${1}",',
            "   height = ${2},",
            "   width = ${3},",
            '   units = "in",',
            "   res = 300",
            ")",
            "${4}",
            "dev.off()",
            "${0}",
          },
          desc = "PNG device",
        },

        {
          prefix = "lap",
          body = {
            "lapply(",
            "   ${1:# Insert here},",
            "   \\(${2:x}) {",
            "      ${3}",
            "   }",
            ")",
            "${0}",
          },
          desc = "lapply anonymous function",
        },

        {
          prefix = "iwalk",
          body = {
            "iwalk(",
            "   ${1:# Insert here},",
            "   \\(${2:x}, name) {",
            "      ${3}",
            "   }",
            ")",
            "${0}",
          },
          desc = "iwalk anonymous function"
        },

        {
          prefix = "lib",
          body = {
            "library(tidyverse)",
            "library(glue)",
            "${0}",
          },
          desc = "libraries"
        },

        {
          prefix = "run_limma",
          body = {
            "run_limma(",
            "  mtx             = ${1},",
            "  meta            = ${2},",
            "  variable        = ${3},",
            "  numerator       = ${4},",
            "  denominator     = ${5},",
            "  output_dir      = ${6},",
            "  output_prefix   = ${7},",
            "  overwrite       = TRUE,",
            "  plotting_p_type = '${8:P.Value}',",
            "  plotting_p_cut  = ${9:0.05},",
            "  gsea_files      = c(",
            "    './input/msigdb_v2023.2.Hs_GMTs/h.all.v2023.2.Hs.symbols.gmt',",
            "    './input/msigdb_v2023.2.Hs_GMTs/c2.cp.v2023.2.Hs.symbols.gmt'",
            "  )",
            ")",
            "${0}",
          },
          desc = "run_limma from whircLimma package"
        },
      }
    })
    MiniSnippets.start_lsp_server({ match = false })

    ---------------------------------------------------------------------------
    -- Icons
    require("mini.icons").setup()

    ---------------------------------------------------------------------------
    -- Clue
    require("mini.clue").setup({
      triggers = {
        -- Leader
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },

        -- Built-in “prefix” keys
        { mode = "n", keys = "w" },
        { mode = "n", keys = "g" },
        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },

        -- Optional: show after Ctrl-w (window commands)
        { mode = "n", keys = "<C-w>" },
      },

      clues = {
        -- Show “real” keymaps with desc from config
        require("mini.clue").gen_clues.builtin_completion(),
        require("mini.clue").gen_clues.g(),
        require("mini.clue").gen_clues.marks(),
        require("mini.clue").gen_clues.registers(),
        require("mini.clue").gen_clues.windows(),

        -- Extra labels for prefixes (nice UX)
        { mode = "n", keys = "<Leader>",  desc = "all"          },
        { mode = "n", keys = "<Leader>c", desc = "colorscheme"  },
        { mode = "n", keys = "<Leader>n", desc = "+notes"       },
        { mode = "n", keys = "<Leader>s", desc = "+split"       },
        { mode = "n", keys = "<Leader>x", desc = "+diagnostics" },
        { mode = "n", keys = "<Leader>g", desc = "+git"         },

      },

      window = {
        delay = 250,
        config = { width = "auto" },
      },
    })

    ---------------------------------------------------------------------------
    -- Autopairs
    require("mini.pairs").setup({
      modes = { insert = true, command = false, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    })

    ---------------------------------------------------------------------------
    -- Mini-files
    require("mini.files").setup({
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
      content = {
        sort = function(entries)
          table.sort(entries, function(a, b)
            return vim.fn.getftime(a.path) > vim.fn.getftime(b.path)
          end)
          return entries
        end,
      },
    })

    ---------------------------------------------------------------------------
    -- Mini fuzzy finder
    require("mini.pick").setup()
    vim.keymap.set("n", "<leader><space>", function()
      require("mini.pick").builtin.files()
    end, { desc = "Fuzzy finder" })

    ---------------------------------------------------------------------------
    -- Indent scope
    require("mini.indentscope").setup({
      symbol = "▏",
      -- symbol = "·",
      options = { try_as_border = true },
      draw = {
        delay = 10,
        animation = require("mini.indentscope").gen_animation.none(),
      },
    })

    ---------------------------------------------------------------------------
    -- Minimap
    local map = require("mini.map")

    map.setup({
      integrations = {
        map.gen_integration.builtin_search(),
        map.gen_integration.diagnostic(),
        map.gen_integration.gitsigns(),

      },

      symbols = {
        encode = map.gen_encode_symbols.dot("3x2"),
      },

      window = {
        side = "right",
        width = 10,
        winblend = 25,
        show_integration_count = false,
      },
    })

    vim.keymap.set("n", "<leader>mm", function()
      MiniMap.toggle()
    end, { desc = "Toggle minimap" })

    -- vim.api.nvim_create_autocmd("VimEnter", {
    --   callback = function()
    --     MiniMap.open()
    --   end,
    -- })

    ---------------------------------------------------------------------------
    -- Starter
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
          return read_lines(base .. "dragon.txt")
          -- return read_lines(base .. "calm.txt")
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

    -- -- Keep mini.tabline visible outside of MiniStarter
    -- vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
    --   callback = function()
    --     -- When not in the starter buffer, ensure tabline is enabled
    --     if vim.bo.filetype ~= "ministarter" then
    --       vim.o.showtabline = 2
    --     end
    --     end
    --   })

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

  end,
}

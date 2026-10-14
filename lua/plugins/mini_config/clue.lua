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



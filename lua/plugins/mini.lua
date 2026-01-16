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
    require("mini.tabline").setup({})

    -- Indent scope: subtle, useful, not noisy
    require("mini.indentscope").setup({
      symbol = "│",
      options = { try_as_border = true },
      draw = {
        delay = 100,
        animation = require("mini.indentscope").gen_animation.none(),
      },
    })

  end,
}


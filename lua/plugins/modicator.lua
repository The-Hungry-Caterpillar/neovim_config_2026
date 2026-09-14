return {
  "mawkler/modicator.nvim",
  event = "VeryLazy",

  init = function()
    vim.o.termguicolors = true
    vim.o.cursorline    = true
    vim.o.number        = true
  end,

  opts = {
    show_warnings = false,

    highlights = {
      defaults = {
        bold = true,
        italic = false,
      },

      use_cursorline_background = true,
    },

    integration = {
      lualine = {
        enabled = false,
      },
    },

  },

}

return {
  "romgrk/barbar.nvim",

  lazy = false,
  priority = 1000,

  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  init = function()
    vim.g.barbar_auto_setup = false
  end,

  opts = {
    animation = true,
    auto_hide = false,
    tabpages = true,
    clickable = true,

    focus_on_close = "left",

    hide = {
      extensions = false,
      inactive = false,
    },

    icons = {
      buffer_index = false,
      buffer_number = false,
      button = false,

      diagnostics = {
        [vim.diagnostic.severity.ERROR] = {
          enabled = true,
          icon = " ",
        },
        [vim.diagnostic.severity.WARN] = {
          enabled = true,
          icon = " ",
        },
        [vim.diagnostic.severity.INFO] = {
          enabled = false,
        },
        [vim.diagnostic.severity.HINT] = {
          enabled = false,
        },
      },

      filetype = {
        custom_colors = false,
        enabled = true,
      },

      modified = {
        button = "●",
      },

      pinned = {
        button = "車",
        filename = true,
      },

      separator = {
        left = "▎",
        right = "",
      },

      separator_at_end = false,

      current = {
        buffer_index = false,
      },

    },

    maximum_padding = 2,
    minimum_padding = 1,
    maximum_length = 30,

    semantic_letters = true,
  },


  keys = {
    { "<S-h>", "<Cmd>BufferPrevious<CR>", desc = "Previous buffer" },
    { "<S-l>", "<Cmd>BufferNext<CR>", desc = "Next buffer" },
    { "<leader>bb", "<Cmd>BufferPick<CR>", desc = "Pick buffer" },
    { "<leader>bd", "<Cmd>BufferClose<CR>", desc = "Close buffer" },
    { "<leader>bp", "<Cmd>BufferPin<CR>", desc = "Toggle buffer pin", },
    { "<leader>b<", "<Cmd>BufferMovePrevious<CR>", desc = "Move buffer left" },
    { "<leader>b>", "<Cmd>BufferMoveNext<CR>", desc = "Move buffer right" },


  },
}

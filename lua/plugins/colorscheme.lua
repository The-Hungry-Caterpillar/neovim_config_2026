return {

  { -- Darkvoid
    'aliqyan-21/darkvoid.nvim',
    lazy     = false,
    priority = 1000,
    config   = function()
      vim.cmd.colorscheme("darkvoid")
    end,
  },

  { -- Deepwhite
    'Verf/deepwhite.nvim',
    lazy     = false,
    priority = 1000,
    config   = function()
      -- vim.cmd.colorscheme("deepwhite")
    end,
  },

  { -- Dracula
    "Mofiqul/dracula.nvim",
    lazy   = false,
    config = function()
      require("dracula").setup({
        transparent_bg = false
      })
      -- vim.cmd.colorscheme("dracula")
    end,
  },

  { -- Evergarden
    "everviolet/nvim",
    lazy   = false,
    config = function()
      require('evergarden').setup({
        theme = {
          variant = 'fall',
          accent = 'green',
        },
        editor = {
          transparent_background = false,
        },
      })
      -- vim.cmd.colorscheme("evergarden")
    end,
  },

  { -- Solarized
    "craftzdog/solarized-osaka.nvim",
    lazy            = false,
    priority        = 1000,
    config          = function()
      require("solarized-osaka").setup({
        transparent = false
      })
      -- vim.cmd.colorscheme("solarized-osaka")
      -- vim.cmd.colorscheme("solarized-osaka-day")
    end
  },

  { -- Srcy
    "srcery-colors/srcery-vim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.g.srcery_background = "NONE"
      -- vim.cmd.colorscheme("srcery")
    end,
  },

  { -- Tokyonight
    "folke/tokyonight.nvim",
    lazy          = false,
    priority      = 1000,
    opts          = {
      transparent = false,
    },
    config        = function(_, opts)
      require("tokyonight").setup(opts)
      -- vim.cmd.colorscheme("tokyonight-moon")
      -- vim.cmd.colorscheme("tokyonight-day")
    end,
  },

  { -- Witch
      "sontungexpt/witch",
      priority = 1000,
      lazy     = false,
      config   = function(_, opts)
          -- require("witch").setup(opts)
      end,
  },

  { -- Yoda
    "kuri-sun/yoda.nvim",
    lazy     = false,
    priority = 1000,
    opts     = {
      theme = "dark", -- "dark" or "light"
      transparent_background = false
    },
    config   = function(_, opts)
      -- require("yoda").setup(opts)
    end
  },

}

return {

  { -- Darkvoid
    'aliqyan-21/darkvoid.nvim',
    lazy     = false,
    priority = 1000,
    config   = function()
      -- vim.cmd.colorscheme("darkvoid")
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
        transparent_bg = true
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
          transparent_background = true,
        },
      })
      -- vim.cmd.colorscheme("evergarden")
    end,
  },

  { -- Kanagawa
    "rebelot/kanagawa.nvim",
    lazy     = false,
    priority = 1000,
    config   = function()
      require('kanagawa').setup({
        transparent = false,
        theme = "wave",
      })
      -- vim.cmd("colorscheme kanagawa")
    end
  },

  { -- Silentium
    "silentium-theme/silentium.nvim",
    lazy     = false,
    priority = 1000,
    config   = function()
      -- vim.cmd.colorscheme("silentium")
    end
  },

  { -- Solarized
    "craftzdog/solarized-osaka.nvim",
    enabled         = false,
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
      lazy     = false,
      priority = 1000,
      config   = function()
          -- vim.cmd.colorscheme("srcery")
      end,
  },

  { -- Tokyonight
    "folke/tokyonight.nvim",
    enabled       = true,
    lazy          = false,
    priority      = 1000,
    opts          = {
      transparent = true,
    },
    config        = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight-moon")
      -- vim.cmd.colorscheme("tokyonight-day")
    end,
  },

  { -- Witch
      "sontungexpt/witch",
      enabled  = false,
      priority = 1000,
      lazy     = false,
      config   = function(_, opts)
          require("witch").setup(opts)
      end,
  },

  { -- Vague
      "vague-theme/vague.nvim",
      lazy     = false,
      priority = 1000,
      config   = function()
          -- vim.cmd.colorscheme("srcery")
      end,
  },


}

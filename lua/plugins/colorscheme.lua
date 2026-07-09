return {

  { -- Darkvoid
    'aliqyan-21/darkvoid.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("darkvoid")
    end,
  },

  { -- Deepwhite
    'Verf/deepwhite.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("deepwhite")
    end,
  },

  { -- Dracula
    "Mofiqul/dracula.nvim",
    lazy = false,
    config = function()
      require("dracula").setup({
        transparent_bg = true
      })
      -- vim.cmd.colorscheme("dracula")
    end, 
  },

  { -- Solarized
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
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
          -- vim.cmd.colorscheme("srcery")
      end,
  },

  { -- Tokyonight
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
        -- vim.opt.background = "light"
      -- vim.cmd.colorscheme("tokyonight")
      -- vim.cmd.colorscheme("tokyonight-day")
    end,
  }

}

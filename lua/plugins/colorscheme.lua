return {

  { -- Deepwhite
    'Verf/deepwhite.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("deepwhite")
    end,
  },

  { -- Devel
    "gnualmalki/devel.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme devel")
    end,
  },

  { -- Dracula
    "Mofiqul/dracula.nvim",
    lazy = false,
    config = function()
      require("dracula").setup({
        transparent_bg = false
      })
      -- vim.cmd.colorscheme("dracula")
    end, 
  },

  { -- Gruvbox
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup()
      -- vim.opt.background = "light"
      -- vim.cmd.colorscheme("gruvbox")
    end, 
  },

  { -- OC-2
    'builtbyleo/oc-2.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("oc-2")
    end,
  },

  { -- Pastel
    "ankushbhagats/pastel.nvim",
    lazy = false, -- disable lazy loading 
    priority = 1000, -- load immediately at startup
    opts = {}, -- your configuration comes here
    config = function()
      -- vim.cmd.colorscheme("pastel")
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

  { -- Tokyonight
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = false
      })
      vim.cmd.colorscheme("tokyonight")
      -- vim.cmd.colorscheme("tokyonight-day")
    end,
  },

}

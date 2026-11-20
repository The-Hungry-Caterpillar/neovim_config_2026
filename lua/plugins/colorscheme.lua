return {

  { -- Darkvoid
    'aliqyan-21/darkvoid.nvim',
    lazy     = false,
    priority = 1000,
  },

  { -- Dracula
    "Mofiqul/dracula.nvim",
    lazy   = false,
    priority = 1000,
    config = function()
      require("dracula").setup({
        transparent_bg = false
      })
    end,
  },

  { -- Kanagawa
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  },

  { -- Moonfly
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000
  },

  { -- Oldworld
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
  },

  { -- Srcy
    "srcery-colors/srcery-vim",
    lazy = false,
    priority = 1000,
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
    end,
  },

  { -- Vercel
    "PunGrumpy/vercel.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("vercel").setup(opts)
    end,
  },

}

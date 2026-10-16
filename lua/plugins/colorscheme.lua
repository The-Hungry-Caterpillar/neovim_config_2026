return {

  { -- Binary
    "jackplus-xyz/binary.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("binary").setup({
        colors = {
          bg = "#66FF66", -- CRT green
          fg = "#000000",
        },
      })
    end,
  },

  { -- Darkvoid
    'aliqyan-21/darkvoid.nvim',
    lazy     = false,
    priority = 1000,
  },

  { -- Deepwhite
    'Verf/deepwhite.nvim',
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
    end,
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

  { -- Solarized
    "craftzdog/solarized-osaka.nvim",
    lazy            = false,
    priority        = 1000,
    config          = function()
      require("solarized-osaka").setup({
        transparent = false
      })
    end
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

  { -- VSCode
      "askfiy/visual_studio_code",
      priority = 100,
      opts = {
        transparent = false
      },
      config = function(_, opts)
        require("visual_studio_code").setup(opts)
          -- vim.cmd.colorscheme("visual_studio_code")
      end,
  },

}

return {

  { -- Ayu
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({
        -- overrides = {
        --   Normal = { bg = "None" },
        --   NormalFloat = { bg = "none" },
        --   ColorColumn = { bg = "None" },
        --   SignColumn = { bg = "None" },
        --   Folded = { bg = "None" },
        --   FoldColumn = { bg = "None" },
        --   CursorLine = { bg = "None" },
        --   CursorColumn = { bg = "None" },
        --   VertSplit = { bg = "None" },
        -- },
      })
      -- vim.cmd.colorscheme("ayu")
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

  { -- Kanagawa
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = false
      })
      -- vim.cmd.colorscheme("kanagawa")
    end,
  },

  {
    "initsyscall/themeInitNvim",
    url = "https://codeberg.org/initsyscall/themeInitNvim",
    priority = 1000,
    config = function()
    end
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
      -- vim.cmd.colorscheme("tokyonight")
      -- vim.cmd.colorscheme("tokyonight-day")
    end,
  },

}

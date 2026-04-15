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

  { -- Citruszest
    "zootedb0t/citruszest.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("citruszest")
    end, 
  },

  { -- Darkvoid
		"darkvoid-theme/darkvoid.nvim",
		lazy = false,
		priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("darkvoid")
    end, 
	},

  { -- Deepwhite
    'Verf/deepwhite.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("deepwhite")
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

  { -- Monokai
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        transparent_background = false
      })
      -- vim.cmd.colorscheme("monokai-pro-classic")
      -- vim.cmd.colorscheme("monokai-pro-light")
    end,
  },

  { -- Nightfox
    "Edeneast/nightfox.nvim",
    lazy = false,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true
        },
      })
      vim.cmd.colorscheme("dayfox")
    end, 
  },

  { -- Nordic
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        bold_keywords = true,
        italic_comments = true,
        transparent = {
          -- Enable transparent background.
          bg = false,
          -- Enable transparent background for floating windows.
          float = false,
        },
        -- Enable brighter float border.
        bright_border = true,
        -- Reduce the overall amount of blue in the theme.
        reduced_blue = true,
      })
      -- vim.cmd.colorscheme("nordic")
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

  { -- VScode
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode").setup({
        transparent = false
      })
      -- vim.cmd.colorscheme("vscode")
    end,
  },

}

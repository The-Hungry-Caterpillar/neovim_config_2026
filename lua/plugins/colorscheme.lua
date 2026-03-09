return {

  { -- Darkvoid
		"darkvoid-theme/darkvoid.nvim",
		lazy = false,
		priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("darkvoid")
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

  { -- e-ink
		"e-ink-colorscheme/e-ink.nvim",
		lazy = false,
		priority = 1000,
    config = function()
      -- vim.o.background = "dark"
      -- vim.cmd.colorscheme("e-ink")
    end, 
	},

  { -- Kanagawa
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("kanagawa")
    end,
  },

  { -- Monokai
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("monokai-pro-classic")
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
          bg = true,
          -- Enable transparent background for floating windows.
          float = false,
        },
        -- Enable brighter float border.
        bright_border = true,
        -- Reduce the overall amount of blue in the theme.
        reduced_blue = true,
      })
      vim.cmd.colorscheme("nordic")
    end
  },
  

  { -- Oasis
    "uhs-robert/oasis.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oasis").setup()
        -- vim.cmd.colorscheme("oasis-starlight")
        -- vim.cmd.colorscheme("oasis-midnight")
        -- vim.cmd.colorscheme("oasis-abyss")
    end
  },

  { -- Solarized
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({
        transparent = true
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
        transparent = true
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
        transparent = true
      })
      -- vim.cmd.colorscheme("vscode")
    end,
  },

  { -- Witch
    "sontungexpt/witch",
    priority = 1000,
    lazy = false,
    config = function()
      -- vim.cmd.colorscheme("witch-light")
    end,
  },

}

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

  { -- Kanagawa
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("kanagawa")
    end,
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
        transparent = false
      })
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
    end,
  },

  { -- VScode
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("vscode")
    end,
  },

  

}

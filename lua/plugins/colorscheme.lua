return {

  { -- Darkearth
    "ptdewey/darkearth-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("darkearth")
    end,
  },

  { -- Darkvoid
		"darkvoid-theme/darkvoid.nvim",
		lazy = false,
		priority = 1000,
    config = function()
      vim.cmd.colorscheme("darkvoid")
    end, 
	},

  { -- Dracula
    "Mofiqul/dracula.nvim",
    lazy = false,
    config = function()
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

  { -- VSCode
    "Mofiqul/vscode.nvim",
    lazy = false,
    config = function()
      -- vim.cmd.colorscheme("vscode")
    end, 
  },

}


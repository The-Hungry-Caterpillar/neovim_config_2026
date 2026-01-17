return {

  { -- Darkearth
    "ptdewey/darkearth-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("darkearth")
    end,
  },

  { -- Devel
		"gnualmalki/devel.nvim",
		lazy = false,
		priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("devel")
    end, 
	},

  { -- Dracula
    "Mofiqul/dracula.nvim",
    lazy = false,
    config = function()
      vim.cmd.colorscheme("dracula-soft")
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


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
      vim.cmd.colorscheme("vscode")
    end, 
  },

  { -- Witch
    "sontungexpt/witch",
    priority = 1000,
    lazy = false,
    config = function()
      -- vim.cmd.colorscheme("witch-dark")
      -- vim.cmd.colorscheme("witch-light")
    end,
  },

}


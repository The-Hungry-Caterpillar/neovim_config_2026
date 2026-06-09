return {

  { -- Deepwhite
    'Verf/deepwhite.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("deepwhite")
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

  { -- Spaceduck
      "pineapplegiant/spaceduck",
      lazy = false,
      priority = 1000,
      config = function()
          vim.opt.termguicolors = true
          -- vim.cmd.colorscheme("spaceduck")
      end,
  },

  { -- Srcy
      "srcery-colors/srcery-vim",
      lazy = false,
      priority = 1000,
      config = function()
          vim.cmd.colorscheme("srcery")
      end,
  },

}

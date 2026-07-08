return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "shellcheck"
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "bashls",
        "lua_ls",
        "jsonls",
        "yamlls",
        "marksman",
        -- "r_language_server", -- easier to install interatively in R
      },

    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable({
        "bashls",
        "lua_ls",
        "jsonls",
        "yamlls",
        "marksman",
        "r_language_server",
      })
    end,
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      -- plugin not installed yet; don't crash startup
      return
    end
    configs.setup({
      highlight = { enable = true },
      ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "r",
          "bash",
          "rnoweb",
          "markdown",
          "yaml"
      },
      auto_install = true,
    })
    indent = {
      enable = true,
      disable = { "r", "rmd", "quarto" },
    }
  end,
}

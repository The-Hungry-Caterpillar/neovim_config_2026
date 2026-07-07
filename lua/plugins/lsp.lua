return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config("r_language_server", {})
    vim.lsp.enable("r_language_server")
  end,
}

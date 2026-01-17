return {
    "nishu-murmu/ThemeSwitch.nvim",
    config = function()
      require("ThemeSwitch").setup({
        keymap = "<leader>c",
      })
    end,
}

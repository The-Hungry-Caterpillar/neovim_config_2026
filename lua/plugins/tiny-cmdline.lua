return {
  "rachartier/tiny-cmdline.nvim",

  init = function()
    vim.o.cmdheight = 0
    require("vim._core.ui2").enable({})
  end,

  opts = {

    width = {
      value = "60%",
      min = 40,
      max = 80,
    },

    position = {
      x = "50%",
      y = "50%",
    },

    border = "rounded",

    -- native_types = { "/", "?" },
    native_types = {},
  },
}

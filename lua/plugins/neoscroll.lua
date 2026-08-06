return {
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  config = function()
    local neoscroll = require("neoscroll")

    neoscroll.setup({
      mappings = {},
    })

    vim.keymap.set("n", "<C-u>", function()
      neoscroll.ctrl_u({ duration = 160 })
    end)

    vim.keymap.set("n", "<C-d>", function()
      neoscroll.ctrl_d({ duration = 160 })
    end)
  end,
}

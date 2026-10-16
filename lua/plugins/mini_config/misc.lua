require("mini.indentscope").setup({
  symbol = "▏",
  options = { try_as_border = true },
  draw = {
    delay = 10,
    animation = require("mini.indentscope").gen_animation.none(),
  },
})

require("mini.pairs").setup({
  modes = { insert = true, command = false, terminal = false },
  skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
  skip_ts = { "string" },
  skip_unbalanced = true,
  markdown = true,
})

require("mini.comment").setup({
  options = {
    custom_commentstring = nil, -- let treesitter decide
  },
})

require("mini.pick").setup()

require("mini.align").setup()

-- require("mini.tabline").setup()

require("mini.icons").setup()

local map = require("mini.map")

map.setup({
  integrations = {
    map.gen_integration.builtin_search(),
    map.gen_integration.diagnostic(),
    map.gen_integration.gitsigns(),

  },

  symbols = {
    encode = map.gen_encode_symbols.dot("3x2"),
  },

  window = {
    side = "right",
    width = 10,
    winblend = 25,
    show_integration_count = false,
  },
})

vim.keymap.set("n", "<leader>mm", function()
  MiniMap.toggle()
end, { desc = "Toggle minimap" })

-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     MiniMap.open()
--   end,
-- })
--

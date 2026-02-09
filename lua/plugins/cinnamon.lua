return {
  "declancm/cinnamon.nvim",
  event = "VeryLazy",
  opts = {
    -- Don't force any mappings you don't want
    keymaps = {
      basic = true,  -- enables smooth <C-u>, <C-d>, <C-b>, <C-f> etc (per plugin)
      extra = false, -- keep it lean
    },

    options = {
      mode = "window",
      count_only = false,
      delay = 7, -- ms between steps (lower = smoother but more redraws)
      max_delta = {
        line = 200, -- skip animation for huge jumps
        column = false,
        time = 250, -- cap total animation time (ms)
      },
    },
  },
}

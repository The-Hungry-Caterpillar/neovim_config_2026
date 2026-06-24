return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    user_default_options = {
      RGB = true,
      RRGGBB = true,
      names = false,    -- skip named colors like "Red" if you don't want noise
      css = false,
      mode = "background", -- or "foreground" or "virtualtext"
    },
  },
}

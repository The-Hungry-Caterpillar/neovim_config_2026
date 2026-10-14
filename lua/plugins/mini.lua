return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("plugins.mini_config.files")
    require("plugins.mini_config.snippets")
    require("plugins.mini_config.clue")
    require("plugins.mini_config.map")
    require("plugins.mini_config.starter")
    require("plugins.mini_config.statusline")
    require("plugins.mini_config.misc")
  end,
}

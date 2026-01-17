return {
  "rachartier/tiny-glimmer.nvim",
  event = "VeryLazy",
  priority = 10,
  config = function()
    require("tiny-glimmer").setup({
      enabled = true,

      disable_warnings = true,

      -- If you switch themes often, consider true
      -- (rebuilds cached highlights on ColorScheme)
      autoreload = true,

      -- Animation timing
      refresh_interval_ms = 8,
      text_change_batch_timeout_ms = 50,

      -- If you use a transparent background,
      -- set this to your background color.
      -- transparency_color = "#000000",

      -- Don’t hijack these filetypes (dashboards, etc.)
      hijack_ft_disabled = {
        -- add: "neo-tree", "TelescopePrompt", etc. if you want
      },

      -- optional: make sure the virtual text draws above other plugins
      virt_text = { priority = 2048 },

      -- Automatic keybinding overwrites
      overwrite = {
        -- Automatically map keys to overwrite operations
        -- Set to false if you have custom mappings or prefer manual API calls
        auto_map = true,

        -- Yank operation animation
        yank = {
          enabled = true,
          default_animation = "fade",
        },

        -- Search navigation animation
        search = {
          enabled = true,
          default_animation = "pulse",
          next_mapping = "n",      -- Key for next match
          prev_mapping = "N",      -- Key for previous match
        },

        -- Paste operation animation
        paste = {
          enabled = true,
          default_animation = "reverse_fade",
          paste_mapping = "p",     -- Paste after cursor
          Paste_mapping = "P",     -- Paste before cursor
        },

        -- Undo operation animation
        undo = {
          enabled = true,
          default_animation = {
            name = "fade",
            settings = {
              from_color = "DiffDelete",
              max_duration = 500,
              min_duration = 500,
            },
          },
          undo_mapping = "u",
        },

        -- Redo operation animation
        redo = {
          enabled = true,
          default_animation = {
            name = "fade",
            settings = {
              from_color = "DiffAdd",
              max_duration = 500,
              min_duration = 500,
            },
          },
          redo_mapping = "<c-r>",
        },
      },


    })
  end,
}


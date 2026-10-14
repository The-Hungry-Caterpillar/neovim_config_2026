local statusline = require("mini.statusline")

statusline.setup({
  use_icons = true,
  set_vim_settings = true,

  content = {

    active = function()
      local git      = statusline.section_git({ trunc_width = 40 })
      local filename = statusline.section_filename({ trunc_width = 140 })
      local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })

      -- Only show warnings
      local diagnostics = vim.diagnostic.get(0, {
        severity = vim.diagnostic.severity.WARN,
      })

      local warnings = ""
      if #diagnostics > 0 then
        warnings = "W" .. #diagnostics
      end

      -- Show macro recording only while recording
      local recording = vim.fn.reg_recording()
      if recording ~= "" then
        recording = "󰑋 REC @" .. recording
      end

      return statusline.combine_groups({
        {
          hl = "MiniStatuslineDevinfo",
          strings = { git, warnings, recording },
        },

        "%<",

        {
          hl = "MiniStatuslineFilename",
          strings = { filename },
        },

        "%=",

        {
          hl = "MiniStatuslineFileinfo",
          strings = { fileinfo },
        },

      })
    end,

  },
})

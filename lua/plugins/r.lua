return {
  "R-nvim/R.nvim",
  ft = { "r", "rmd", "quarto" }, -- load only when relevant
  -- optional: if you use a markdown/quarto workflow you may want these
  dependencies = {
    "R-nvim/cmp-r", -- optional, only if you use nvim-cmp later
  },
  config = function()
    local opts = {
      bracketed_paste = true,

      R_args = { "--quiet", "--no-save" },
      pdfviewer = "xdg-open",

      quarto_chunk_hl = {
        highlight = false,
        bg = "#222222",
      },

      hook = {
        on_filetype = function()
          -- buffer-local maps for R buffers
          local bufnr = vim.api.nvim_get_current_buf()

          vim.keymap.set("n", "<CR>", "<Plug>RDSendLine", { buffer = bufnr, silent = true })
          vim.keymap.set("v", "<CR>", "<Plug>RSendSelection", { buffer = bufnr, silent = true })

          -- Insert-mode "fd" => <- assignment
          vim.keymap.set("i", "fd", "<Plug>RInsertAssign", { buffer = bufnr, silent = true, remap = true })
        end,
      },

      -- vertical split defaults
      min_editor_width = 72,
      rconsole_width = 80,

      -- if you later prefer horizontal split, use these instead:
      -- rconsole_width = 0,
      -- rconsole_height = 40,

      disable_cmds = {
        "RClearConsole",
        "RCustomStart",
        "RSPlot",
        "RSaveClose",
      },
    }

    if vim.env.R_AUTO_START == "true" then
      opts.auto_start = 1
      opts.objbr_auto_start = true
    end

    require("r").setup(opts)
  end,
}

return {
  "LuxVim/nvim-luxmotion",
  event = "VeryLazy", -- avoid impacting startup

  config = function()
    local lux = require("luxmotion")

    lux.setup({
      -- Cursor motion is the most "expensive" + most noticeable in terminal UIs.
      -- Keep it off by default; turn it on only in GUIs if you want.
      cursor = {
        enabled = vim.g.neovide == true, -- only animate cursor in Neovide
        duration = 55,
        easing = "linear",
      },

      -- Scroll motion gives the biggest “feels nice” boost for the least cost.
      scroll = {
        enabled = true,
        duration = 75,          -- small but visible
        easing = "ease-out",    -- smooth but not heavy
      },

      -- Use plugin’s performance mode (faster, less fancy)
      performance = { enabled = true },

      -- Don’t add extra mappings unless you really want them.
      -- If LuxMotion hooks default scroll anyway, extra keymaps can be unnecessary.
      keymaps = {
        cursor = false,
        scroll = true,
      },
    })

    -- Optional: auto-disable motion in huge buffers (HPC logs / big data files)
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      callback = function(args)
        local big = vim.api.nvim_buf_line_count(args.buf) > 20000
        if big then
          -- If LuxMotion exposes enable/disable toggles, use them.
          -- (The README indicates you can enable/disable cursor/scroll animations.) :contentReference[oaicite:1]{index=1}
          pcall(function()
            lux.setup({
              cursor = { enabled = false },
              scroll = { enabled = false },
            })
          end)
        end
      end,
    })
  end,
}

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    preview_config = {
      border = "rounded",
    },

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, {

          buffer = bufnr,
          desc = desc,
        })
      end

      map("<leader>gl", gs.preview_hunk, "Preview hunk")
      map("<leader>gs", gs.stage_hunk, "Stage hunk")
      map("<leader>gr", gs.reset_hunk, "Reset hunk")
      map("<leader>gb", gs.blame_line, "Blame line")
      map("<leader>gj", gs.next_hunk, "Next git hunk")
      map("<leader>gk", gs.prev_hunk, "Previous git hunk")
    end,
  },
}

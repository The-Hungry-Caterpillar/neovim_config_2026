require("mini.files").setup({
  windows = {
    preview = true,
    width_focus = 30,
    width_preview = 30,
  },
  content = {
    sort = function(entries)
      table.sort(entries, function(a, b)
        return vim.fn.getftime(a.path) > vim.fn.getftime(b.path)
      end)
      return entries
    end,
  },
})


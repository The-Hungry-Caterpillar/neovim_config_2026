local files = require("mini.files")

files.setup({
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

-- Directory Neovim was launched from
local startup_dir = vim.fn.getcwd()

-- Open explorer in current buffer's directory
vim.keymap.set("n", "<leader>e", function()
  local path = vim.api.nvim_buf_get_name(0)

  -- Fall back to startup directory for special/unnamed buffers
  if path == "" or vim.fn.filereadable(path) == 0 then
    path = startup_dir
  else
    path = vim.fs.dirname(path)
  end

  files.open(path, false)
end, { desc = "Explorer: buffer directory" })

-- Open explorer in directory Neovim was launched from
vim.keymap.set("n", "<leader>E", function()
  files.open(startup_dir, false)
end, { desc = "Explorer: startup directory" })

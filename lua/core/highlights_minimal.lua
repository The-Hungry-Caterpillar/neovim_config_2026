local function with_style(group, opts)
  local hl = vim.api.nvim_get_hl(0, {
    name = group,
    link = false,
  })

  return vim.tbl_extend("force", hl, opts)
end

local function apply()
  vim.api.nvim_set_hl(
    0,
    "@operator.r",
    with_style("Operator", { bold = true })
  )

  vim.api.nvim_set_hl(
    0,
    "@keyword.function.r",
    with_style("Keyword", { bold = true })
  )

  vim.api.nvim_set_hl(
    0,
    "@variable.parameter.r",
    with_style("Identifier", { italic = true })
  )

  vim.api.nvim_set_hl(
    0,
    "@comment.r",
    with_style("Comment", { italic = true })
  )
end

-- Initial startup
apply()

-- Reapply after a colorscheme has completely finished changing
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.schedule(apply)
  end,
})

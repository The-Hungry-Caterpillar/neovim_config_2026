local function with_style(group, opts)
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
  return vim.tbl_extend("force", hl, opts)
end

local function apply()
  -- operators: style only, no hard-coded color
  vim.api.nvim_set_hl(
    0,
    "@operator.r",
    with_style("Operator", { bold = true })
  )

  -- function(...) keyword only
  vim.api.nvim_set_hl(
    0,
    "@keyword.function.r",
    with_style("Keyword", { bold = true })
  )

  -- parameters only
  vim.api.nvim_set_hl(
    0,
    "@variable.parameter.r",
    with_style("Identifier", { italic = true })
  )

  -- comments only
  vim.api.nvim_set_hl(
    0,
    "@comment.r",
    with_style("Comment", { italic = true })
  )
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply,
})

apply()

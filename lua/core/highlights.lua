local function with_style(group, opts)
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
  return vim.tbl_extend("force", hl, opts)
end

local function apply()
  -- Bright structural operators
  vim.api.nvim_set_hl(0, "@operator.r", {
    fg = "#ffcc66",
    bold = true,
  })

  -- Function calls
  vim.api.nvim_set_hl(
    0,
    "@function.call.r",
    with_style("Function", { bold = true })
  )

  -- function(...) keyword
  vim.api.nvim_set_hl(
    0,
    "@keyword.function.r",
    with_style("Keyword", { bold = true })
  )

  -- Function parameters
  vim.api.nvim_set_hl(
    0,
    "@variable.parameter.r",
    with_style("Identifier", { italic = true })
  )

  -- Comments
  vim.api.nvim_set_hl(
    0,
    "@comment.r",
    with_style("Comment", { italic = true })
  )

  vim.api.nvim_set_hl(
    0,
    "@operator.r", {
      fg = "#ffcc66",
      bold = true,
    }
  )

end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply,
})

apply()

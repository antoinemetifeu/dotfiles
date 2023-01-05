local M = {}

function M.setup()
  local opt = vim.opt
  local g = vim.g

  opt.list = true
  opt.listchars:append 'eol:↴'

  g.indent_blankline_show_end_of_line = true
end

return M
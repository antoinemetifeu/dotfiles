local M = {}

function M.setup()
  local g = vim.g

  g.doge_doc_standard_python = 'google'
  g.doge_mapping_comment_jump_forward = '<C-j>'
  g.doge_mapping_comment_jump_backward = '<C-k>'
  g.doge_mapping = ''
end

return M
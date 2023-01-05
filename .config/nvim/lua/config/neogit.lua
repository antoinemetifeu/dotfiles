local M = {}

function M.setup()
  local neogit = require 'neogit'

  -- TODO: integrate sindrets/diffview.nvim
  neogit.setup {}
end

return M
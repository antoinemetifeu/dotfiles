local M = {}

local ls = require 'luasnip'

function M.setup()
  -- Lazy load snippets
  require('luasnip.loaders.from_vscode').lazy_load()
  -- require('luasnip.loaders.from_snipmate').lazy_load()
end

return M
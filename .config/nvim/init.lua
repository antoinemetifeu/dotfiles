require 'config'
require 'utils'
require('plugins').setup()

-- [[ LEADER ]]
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
-- vim.g.mapleader = ","
-- vim.g.localleader = "\\"

-- disable netrw (recommanded by nvim-tree/nvim-tree.lua)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- vim.opt.termguicolors = true

-- require('options')
-- require('keymaps')
-- require('statusline')

-- vim.cmd('colorscheme nightfox')

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
--vim.g.mapleader = ","
--vim.g.localleader = "\\"

-- IMPORTS
--require('vars')      -- Variables
--require('opts')      -- Options
--require('keys')      -- Keymaps
--require('plug')      -- Plugins

-- PLUGINS
--require('nvim-tree').setup{}
--require('lualine').setup {
--  options = {
--    theme = 'dracula-nvim'
--  }
--}

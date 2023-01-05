local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },

    display = {
      open_fn = function()
        return require('packer.util').float { border = 'rounded' }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end

    -- Run PackerCompile if there are changes in this file
    -- vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
    local packer_grp = vim.api.nvim_create_augroup('packer_user_config', { clear = true })
    vim.api.nvim_create_autocmd(
      { 'BufWritePost' },
      { pattern = 'init.lua', command = 'source <afile> | PackerCompile', group = packer_grp }
    )
  end

  -- Plugins
  local function plugins(use)
    use { 'wbthomason/packer.nvim' }

    -- Performance
    use { 'lewis6991/impatient.nvim' }

    -- Load only when require
    use { 'nvim-lua/plenary.nvim', module = 'plenary' }

    -- Notification
    use {
      'rcarriga/nvim-notify',
      event = 'BufReadPre',
      config = function()
        require('config.notify').setup()
      end,
    }

    -- Colorscheme
    use {
      'folke/tokyonight.nvim',
      config = function()
        vim.cmd [[colorscheme tokyonight]]
      end,
    }

    -- Startup screen
    use {
      'goolord/alpha-nvim',
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        -- TODO: create a custom config
        require('alpha').setup(require('alpha.themes.dashboard').config)
        -- require('config.alpha').setup()
      end,
    }

    -- TODO: is it useful ?
    -- Better Netrw
    use { 'tpope/vim-vinegar', event = 'BufReadPre' }

    -- Better icons
    use {
      'nvim-tree/nvim-web-devicons',
      module = 'nvim-web-devicons',
      config = function()
        require('nvim-web-devicons').setup { default = true }
      end,
    }

    -- Color highlighter
    use {
      'nvchad/nvim-colorizer.lua',
      cmd = 'ColorizerToggle',
      config = function()   
        require('colorizer').setup()
      end,
    }

    -- Git
    use {
      'TimUntersberger/neogit',
      requires = { 'nvim-lua/plenary.nvim' },
      cmd = 'Neogit',
      module = { 'neogit' },
      config = function()
        require('config.neogit').setup()
      end,
    }

    use {
      'lewis6991/gitsigns.nvim',
      event = 'BufReadPre',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('config.gitsigns').setup()
      end,
    }

    use {
      'tpope/vim-fugitive',
      opt = true,
      cmd = { 'Git', 'GBrowse', 'Gdiffsplit', 'Gvdiffsplit' },
      requires = {
        'tpope/vim-rhubarb',
        'idanarye/vim-merginal',
      },
    }
    use {
      'rbong/vim-flog',
      cmd = { 'Flog', 'Flogsplit', 'Floggit' },
      wants = { 'vim-fugitive' },
    }

    use {
      'ruifm/gitlinker.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      module = 'gitlinker',
      config = function()
        require('gitlinker').setup { mappings = nil }
      end,
    }

    use {
      'pwntester/octo.nvim',
      cmd = 'Octo',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'nvim-tree/nvim-web-devicons',
      },
      config = function()
        require('octo').setup()
      end,
    }

    use {
      'akinsho/git-conflict.nvim',
      cmd = {
        'GitConflictChooseTheirs',
        'GitConflictChooseOurs',
        'GitConflictChooseBoth',
        'GitConflictChooseNone',
        'GitConflictNextConflict',
        'GitConflictPrevConflict',
        'GitConflictListQf',
      },
      config = function()
        require('git-conflict').setup()
      end,
    }

    -- use { 'f-person/git-blame.nvim', cmd = { 'GitBlameToggle' } }

    -- TODO: need Neovim 0.8+
    use {
      'tanvirtin/vgit.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('vgit').setup()
      end,
      cmd = { 'VGit' },
    }
    
    use {
      'mattn/vim-gist',
      opt = true,
      requires = { 'mattn/webapi-vim' },
      cmd = { 'Gist' },
      config = function()
        vim.g.gist_open_browser_after_post = 1
      end,
    }

    -- Silicon
    use { 'segeljakt/vim-silicon', cmd = { 'Silicon' } }

    -- WhichKey
    use {
      'folke/which-key.nvim',
      event = 'VimEnter',
      module = { 'which-key' },
      config = function()
        require('config.whichkey').setup()
      end,
    }

    -- IndentLine
    use {
      'lukas-reineke/indent-blankline.nvim',
      event = 'BufReadPre',
      config = function()
        require('config.indentblankline').setup()
      end,
    }

    -- Better Comment
    use {
      'numToStr/Comment.nvim',
      keys = { 'gc', 'gcc', 'gbc' },
      config = function()
        require('config.comment').setup()
      end,
    }

    -- Better surround
    use { 'tpope/vim-surround', event = 'BufReadPre' }

    -- Motions
    use { 'andymass/vim-matchup', event = 'CursorMoved' }

    use { 'wellle/targets.vim', event = 'CursorMoved', disable = false }

    use {
      'unblevable/quick-scope',
      keys = { 'F', 'f', 'T', 't' },
      -- config = function()
      --   vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
      -- end,
    }

    use { 'chaoren/vim-wordmotion', opt = true, fn = { '<Plug>WordMotion_w' } }

    --- Buffer
    use { 'kazhala/close-buffers.nvim', cmd = { 'BDelete', 'BWipeout' } }

    use {
      'matbme/JABS.nvim',
      cmd = 'JABSOpen',
      config = function()
        require('config.jabs').setup()
      end,
    }

    use {
      'chentoast/marks.nvim',
      event = 'BufReadPre',
      config = function()
        require('marks').setup {}
      end,
    }

    -- IDE
    use {
      'max397574/better-escape.nvim',
      event = { 'InsertEnter' },
      config = function()
        require('better_escape').setup {
          mapping = { 'jk' },
          keys = '<ESC>',
        }
      end,
    }

    use { 'mbbill/undotree', cmd = { 'UndotreeToggle' } }

    use {
      'echasnovski/mini.nvim',
      event = { 'BufReadPre' },
      config = function()
        require('config.mini').setup()
      end,
    }

    -- Code documentation
    use {
      'danymat/neogen',
      requires = { 'nvim-treesitter/nvim-treesitter' },
      config = function()
        require('config.neogen').setup()
      end,
      cmd = { 'Neogen' },
      module = 'neogen',
    }

    use {
      'kkoomen/vim-doge',
      run = ':call doge#install()',
      config = function()
        require('config.doge').setup()
      end,
      cmd = { 'DogeGenerate', 'DogeCreateDocStandard' },
    }

    -- Jumps
    use {
      'ggandor/leap.nvim',
      keys = { 's', 'S' },
      config = function()
        local leap = require 'leap'
        leap.add_default_mappings()
      end,
      disable = false,
    }

    use {
      'abecodes/tabout.nvim',
      after = { 'nvim-cmp' },
      config = function()
        require('tabout').setup {
          completion = false,
          ignore_beginning = true,
        }
      end,
    }

    use { 'AndrewRadev/splitjoin.vim', keys = { 'gS', 'gJ' }, disable = false }

    -- Markdown
    use {
      'iamcco/markdown-preview.nvim',
      opt = true,
      run = function()
        vim.fn['mkdp#util#install']()
      end,
      ft = 'markdown',
      cmd = { 'MarkdownPreview' },
    }
    use {
      'jakewvincent/mkdnflow.nvim',
    --   rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
      config = function()
        require('mkdnflow').setup {}
      end,
      ft = 'markdown',
    }

    -- Status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true },
      event = 'BufReadPre',
      config = function()
        require('config.lualine').setup()
      end,
    }

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
      config = function()
        require('config.treesitter').setup()
      end,
      requires = {
        { 'nvim-treesitter/nvim-treesitter-textobjects', event = 'BufReadPre' },
        { 'windwp/nvim-ts-autotag', event = 'InsertEnter' },
        { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'BufReadPre' },
        { 'p00f/nvim-ts-rainbow', event = 'BufReadPre' },
        { 'RRethy/nvim-treesitter-textsubjects', event = 'BufReadPre' },
        { 'nvim-treesitter/playground', cmd = { 'TSPlaygroundToggle' } },
        -- {
        --   'lewis6991/spellsitter.nvim',
        --   config = function()
        --     require('spellsitter').setup()
        --   end,
        -- },
        -- { 'nvim-treesitter/nvim-treesitter-context', event = 'BufReadPre', disable = true },
        -- { 'mfussenegger/nvim-treehopper', module = { 'tsht' }, disable = true },
        {
          'm-demare/hlargs.nvim',
          config = function()
            require('config.hlargs').setup()
          end,
          disable = false,
        },
      },
    }

    use {
      'nvim-telescope/telescope.nvim',
      event = { 'VimEnter' },
      config = function()
        require('config.telescope').setup()
      end,
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          run = 'make',
        },
        { 'nvim-telescope/telescope-project.nvim' },
        { 'cljoly/telescope-repo.nvim' },
        { 'nvim-telescope/telescope-file-browser.nvim' },
        {
          'nvim-telescope/telescope-frecency.nvim',
          requires = 'kkharji/sqlite.lua',
        },
        {
          'ahmedkhalf/project.nvim',
          config = function()
            require('config.project').setup()
          end,
        },
        { 'nvim-telescope/telescope-dap.nvim' },
        {
          'AckslD/nvim-neoclip.lua',
          requires = {
            { 'kkharji/sqlite.lua', module = 'sqlite' },
          },
        },
        { 'nvim-telescope/telescope-smart-history.nvim' },
        -- Cannot install, luarocks/hererocks freeze...
        -- {
        --   'alpha2phi/telescope-arecibo.nvim',
        --   rocks = { 'openssl", "lua-http-parser' },
        -- },
        { 'nvim-telescope/telescope-media-files.nvim' },
        { 'dhruvmanila/telescope-bookmarks.nvim' },
        { 'nvim-telescope/telescope-github.nvim' },
        { 'jvgrootveld/telescope-zoxide' },
        { 'Zane-/cder.nvim' },
        'nvim-telescope/telescope-symbols.nvim',
        -- 'nvim-telescope/telescope-ui-select.nvim',
      },
    }

    -- nvim-tree
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons',
        opt = true,
      },
      opt = true,
      cmd = { 'NvimTreeToggle', 'NvimTreeClose' },
      config = function()
        require('config.nvimtree').setup()
      end,
    }

    -- Buffer line
    use {
      'akinsho/nvim-bufferline.lua',
      requires = { 'nvim-tree/nvim-web-devicons' },
      event = 'BufReadPre',
      config = function()
        require('config.bufferline').setup()
      end,
    }

    -- User interface
    use {
      'stevearc/dressing.nvim',
      event = 'BufReadPre',
      config = function()
        require('dressing').setup {
          input = { relative = 'editor' },
          select = {
            backend = { 'telescope', 'fzf', 'builtin' },
          },
        }
      end,
    }

    -- Completion
    use {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      opt = true,
      config = function()
        require('config.cmp').setup()
      end,
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
        'ray-x/cmp-treesitter',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        { 'hrsh7th/cmp-nvim-lsp', module = { 'cmp_nvim_lsp' } },
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'lukas-reineke/cmp-rg',
        'davidsierradz/cmp-conventionalcommits',
        { 'onsails/lspkind-nvim', module = { 'lspkind' } },
        -- 'hrsh7th/cmp-calc',
        -- 'f3fora/cmp-spell',
        -- 'hrsh7th/cmp-emoji',
        {
          'L3MON4D3/LuaSnip',
          config = function()
            require('config.snip').setup()
          end,
          module = { 'luasnip' },
        },
        'rafamadriz/friendly-snippets',
        'honza/vim-snippets',
        -- { 'tzachar/cmp-tabnine', run = './install.sh', disable = true },
      },
    }

    -- Auto pairs
    use {
      'windwp/nvim-autopairs',
      opt = true,
      event = 'InsertEnter',
      module = { 'nvim-autopairs.completion.cmp', 'nvim-autopairs' },
      config = function()
        require('config.autopairs').setup()
      end,
    }

    -- Auto tag
    use {
      'windwp/nvim-ts-autotag',
      opt = true,
      event = 'InsertEnter',
      config = function()
        require('nvim-ts-autotag').setup { enable = true }
      end,
    }

    -- End wise
    use {
      'RRethy/nvim-treesitter-endwise',
      opt = true,
      event = 'InsertEnter',
      disable = false,
    }

    -- LSP
    use {
      'neovim/nvim-lspconfig',
      config = function()
        require('config.lsp').setup()
      end,
      requires = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        'folke/neodev.nvim',
        'RRethy/vim-illuminate',
        'jose-elias-alvarez/null-ls.nvim',
        {
          'j-hui/fidget.nvim',
          config = function()
            require('fidget').setup {}
          end,
        },
        { 'b0o/schemastore.nvim', module = { 'schemastore' } },
        { 'jose-elias-alvarez/typescript.nvim', module = { 'typescript' } },
        {
          'SmiteshP/nvim-navic',
          config = function()
            require('nvim-navic').setup {}
          end,
          module = { 'nvim-navic' },
        },
        {
          'simrat39/inlay-hints.nvim',
          config = function()
            require('inlay-hints').setup()
          end,
        },
        {
          'theHamsta/nvim-semantic-tokens',
          config = function()
            require('config.semantictokens').setup()
          end,
          disable = false,
        },
      },
    }

    -- trouble.nvim
    use {
      'folke/trouble.nvim',
      requires = { 'nvim-tree/nvim-web-devicons' },
      cmd = { 'TroubleToggle', 'Trouble' },
      module = { 'trouble', 'trouble.providers.telescope' },
      config = function()
        require('trouble').setup {
          use_diagnostic_signs = true,
        }
      end,
    }

    -- lspsaga.nvim
    use {
      'glepnir/lspsaga.nvim',
      cmd = { 'Lspsaga' },
      config = function()
        require('lspsaga').init_lsp_saga()
      end,
    }

    -- renamer.nvim
    use {
      'filipdutescu/renamer.nvim',
      module = { 'renamer' },
      config = function()
        require('renamer').setup {}
      end,
    }

    -- Rust
    use {
      'simrat39/rust-tools.nvim',
      requires = { 'nvim-lua/plenary.nvim', 'rust-lang/rust.vim' },
      opt = true,
      module = 'rust-tools',
      ft = { 'rust' },
    }
    use {
      'saecki/crates.nvim',
      event = { 'BufRead Cargo.toml' },
      requires = { { 'nvim-lua/plenary.nvim' } },
      config = function()
        require('crates').setup {
          null_ls = {
            enabled = true,
            name = 'crates.nvim',
          },
        }
      end,
      disable = false,
    }

    --- Go
    use {
      'ray-x/go.nvim',
      ft = { 'go' },
      config = function()
        require('go').setup()
      end,
      disable = false,
    }

    --- Java
    use { 'mfussenegger/nvim-jdtls', ft = { 'java' } }

    --- Flutter
    use {
      'akinsho/flutter-tools.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('config.flutter').setup()
      end,
      disable = true,
    }

    --- Kotlin
    use { 'udalov/kotlin-vim', ft = { 'kotlin' }, disable = true }

    -- Terminal
    use {
      'akinsho/toggleterm.nvim',
      keys = { [[<C-\>]] },
      cmd = { 'ToggleTerm', 'TermExec' },
      module = { 'toggleterm', 'toggleterm.terminal' },
      config = function()
        require('config.toggleterm').setup()
      end,
    }

    -- Debugging
    use {
      'mfussenegger/nvim-dap',
      opt = true,
      module = { 'dap' },
      requires = {
        { 'theHamsta/nvim-dap-virtual-text', module = { 'nvim-dap-virtual-text' } },
        { 'rcarriga/nvim-dap-ui', module = { 'dapui' } },
        { 'mfussenegger/nvim-dap-python', module = { 'dap-python' } },
        'nvim-telescope/telescope-dap.nvim',
        { 'leoluz/nvim-dap-go', module = 'dap-go' },
        { 'jbyuki/one-small-step-for-vimkind', module = 'osv' },
        { 'mxsdev/nvim-dap-vscode-js', module = { 'dap-vscode-js' } },
        {
          'microsoft/vscode-js-debug',
          opt = true,
          run = 'npm install --legacy-peer-deps && npm run compile',
        },
      },
      config = function()
        require('config.dap').setup()
      end,
    }

    -- Test
    use {
      'nvim-neotest/neotest',
      requires = {
        {
          'vim-test/vim-test',
          event = { 'BufReadPre' },
          config = function()
            require('config.test').setup()
          end,
        },
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        { 'nvim-neotest/neotest-vim-test', module = { 'neotest-vim-test' } },
        { 'nvim-neotest/neotest-python', module = { 'neotest-python' } },
        { 'nvim-neotest/neotest-plenary', module = { 'neotest-plenary' } },
        { 'nvim-neotest/neotest-go', module = { 'neotest-go' } },
        { 'haydenmeade/neotest-jest', module = { 'neotest-jest' } },
        { 'rouge8/neotest-rust', module = { 'neotest-rust' } },
      },
      module = { 'neotest', 'neotest.async' },
      config = function()
        require('config.neotest').setup()
      end,
    }

    -- HTTP client
    use {
      'NTBBloodbath/rest.nvim', -- rest-nvim/rest.nvim
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('rest-nvim').setup {}
        vim.keymap.set('n', '<C-j>', '<Plug>RestNvim', { noremap = true, silent = true })
      end,
      disable = true,
    }

    -- AI completion
    use { 'github/copilot.vim', event = 'InsertEnter', disable = true }

    -- Legendary
    use {
      'mrjones2014/legendary.nvim',
      opt = true,
      keys = { [[<C-p>]] },
      module = { 'legendary' },
      cmd = { 'Legendary' },
      config = function()
        require('config.legendary').setup()
      end,
    }

    -- Harpoon
    use {
      'ThePrimeagen/harpoon',
      requires = { 'nvim-lua/plenary.nvim' },
      module = {
        'harpoon',
        'harpoon.cmd-ui',
        'harpoon.mark',
        'harpoon.ui',
        'harpoon.term',
        'telescope._extensions.harpoon',
      },
      config = function()
        require('config.harpoon').setup()
      end,
    }

    -- Refactoring
    use {
      'ThePrimeagen/refactoring.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-treesitter/nvim-treesitter' }
      },
      module = { 'refactoring', 'telescope' },
      keys = { [[<leader>r]] },
      config = function()
        require('config.refactoring').setup()
      end,
    }
    use {
      'kevinhwang91/nvim-bqf',
      ft = 'qf',
      config = function()
        require('bqf').setup()
      end,
    }
    use {
      'nvim-pack/nvim-spectre',
      requires = { 'nvim-lua/plenary.nvim' },
      module = 'spectre',
      keys = { '<leader>s' }
    }
    use {
      'https://gitlab.com/yorickpeterse/nvim-pqf',
      event = 'BufReadPre',
      config = function()
        require('pqf').setup()
      end,
    }
    use {
      'andrewferrier/debugprint.nvim',
      module = { 'debugprint' },
      keys = { 'g?p', 'g?P', 'g?v', 'g?V', 'g?o', 'g?O' },
      cmd = { 'DeleteDebugPrints' },
      config = function()
        require('debugprint').setup()
      end,
    }

    -- Performance
    use { 'dstein64/vim-startuptime', cmd = 'StartupTime' }

    use {
      'nathom/filetype.nvim',
      cond = function()
        return vim.fn.has 'nvim-0.8.0' == 0
      end,
    }

    -- Web
    use {
      'vuki656/package-info.nvim',
      opt = true,
      requires = {
        'MunifTanjim/nui.nvim',
      },
      module = { 'package-info' },
      ft = { 'json' },
      config = function()
        require('config.package').setup()
      end,
    }

    -- Session
    use {
      'rmagatti/auto-session',
      opt = true,
      cmd = { 'SaveSession', 'RestoreSession' },
      requires = { 'rmagatti/session-lens' },
      config = function()
        require('bad_practices').setup()
      end,
    }

    -- Todo
    use {
      'folke/todo-comments.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('config.todocomments').setup()
      end,
      cmd = { 'TodoQuickfix', 'TodoTrouble', 'TodoTelescope' },
    }

    -- Diffview
    use {
      'sindrets/diffview.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles' },
    }

    --- Sidebar
    use {
      'sidebar-nvim/sidebar.nvim',
      cmd = { 'SidebarNvimToggle' },
      config = function()
        require('sidebar-nvim').setup { open = false }
      end,
    }

    use {
      'stevearc/aerial.nvim',
      config = function()
        require('aerial').setup {
          backends = { 'treesitter', 'lsp' },
          on_attach = function(bufnr)
            vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
            vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
          end,
        }
      end,
      module = { 'aerial', 'telescope._extensions.aerial' },
      cmd = { 'AerialToggle' },
    }

    -- Translation
    use {
      'voldikss/vim-translator',
      cmd = { 'Translate', 'TranslateV', 'TranslateW', 'TranslateWV', 'TranslateR', 'TranslateRV', 'TranslateX' },
      config = function()
        vim.g.translator_target_lang = 'fr'
        vim.g.translator_history_enable = true
      end,
    }
    use {
      'potamides/pantran.nvim',
      cmd = 'Pantran',
    }

    -- Task runner
    use {
      'stevearc/overseer.nvim',
      opt = true,
      module = { 'neotest.consumers.overseer' },
      cmd = {
        'OverseerToggle',
        'OverseerOpen',
        'OverseerRun',
        'OverseerBuild',
        'OverseerClose',
        'OverseerLoadBundle',
        'OverseerSaveBundle',
        'OverseerDeleteBundle',
        'OverseerRunCmd',
        'OverseerQuickAction',
        'OverseerTaskAction',
      },
      config = function()
        require('overseer').setup()
      end,
    }
    use {
      'michaelb/sniprun',
      run = 'bash ./install.sh',
      cmd = { 'SnipRun', 'SnipInfo', 'SnipReset', 'SnipReplMemoryClean', 'SnipClose', 'SnipLive' },
      module = { 'sniprun', 'sniprun.api' },
    }

    -- Database
    use {
      'tpope/vim-dadbod',
      opt = true,
      requires = {
        'kristijanhusak/vim-dadbod-ui',
        'kristijanhusak/vim-dadbod-completion',
        --[[ 'abenz1267/nvim-databasehelper', ]]
      },
      config = function()
        require('config.dadbod').setup()
      end,
      cmd = { 'DBUIToggle', 'DBUI', 'DBUIAddConnection', 'DBUIFindBuffer', 'DBUIRenameBuffer', 'DBUILastQueryInfo' },
    }
    use {
      'nanotee/sqls.nvim',
      module = { 'sqls' },
      cmd = {
        'SqlsExecuteQuery',
        'SqlsExecuteQueryVertical',
        'SqlsShowDatabases',
        'SqlsShowSchemas',
        'SqlsShowConnections',
        'SqlsSwitchDatabase',
        'SqlsSwitchConnection',
      },
    }
    use {
      'dinhhuy258/vim-database',
      run = ':UpdateRemotePlugins',
      cmd = { 'VDToggleDatabase', 'VDToggleQuery', 'VimDatabaseListTablesFzf' },
    }

    -- Bootstrap Neovim
    if packer_bootstrap then
      print 'Neovim restart is required after installation!'
      require('packer').sync()
    end
  end

  -- Init and start packer
  packer_init()
  local packer = require 'packer'

  -- Performance
  pcall(require, 'impatient')
  -- pcall(require, 'packer_compiled')

  packer.init(conf)
  packer.startup(plugins)
end

return M

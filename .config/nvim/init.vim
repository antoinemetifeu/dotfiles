set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')

" Colorscheme
Plug 'morhetz/gruvbox'


" ----- Vim as a programmer's text editor -----

" Statusline / tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Other statusline / tabline (more lighter)
" Plug 'itchyny/lightline.vim'

" Make tmux look like vim-airline
Plug 'edkolev/tmuxline.vim'


" Tree explorer
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


" Automated tag generation and syntax highlighting
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" Display tags in a window
Plug 'majutsushi/tagbar'


" EditorConfig plugin
Plug 'editorconfig/editorconfig-vim'


" A vim wrapper for running test
Plug 'janko-m/vim-test'


" Comment functions so powerful
Plug 'scrooloose/nerdcommenter'


" Indent guides
Plug 'nathanaelkane/vim-indent-guides'


" Better whitespace highlighting
Plug 'ntpeters/vim-better-whitespace'


" A vim alignement plugin
Plug 'junegunn/vim-easy-align'

" Text-filtering and alignment
Plug 'godlygeek/tabular'


" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'


" Use CTRL-A/CTRL-X to increment dates, times and more
Plug 'tpope/vim-speeddating'


" A vim plugin to colorize all text in the form #rgb,#rgba,rgb(),rgba(),etc
Plug 'lilydjwg/colorizer'

" Simple color selector/picker
Plug 'KabbAmine/vCoolor.vim'


" ----- Git -----

" Show a git diff in the sign column
Plug 'airblade/vim-gitgutter'

" Show a diff in the sign column (same as vim-gitgutter but multi-vcs)
" Plug 'mhinz/vim-signify'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Git commit browser
Plug 'junegunn/gv.vim'


" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'

" A command-line fuzzy finder written in Go
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


" Perform all your vim insert mode completions with Tab
Plug 'ervandew/supertab'


" Distraction-free writing
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

" Hyperfocus-writing
Plug 'junegunn/limelight.vim'


" ----- Syntax, snippets & other languages plugins -----

" Syntax checking hacks
Plug 'vim-syntastic/syntastic'

Plug 'mtscout6/syntastic-local-eslint.vim'

" Check a file's syntax when saving a file
" Plug 'tomtom/checksyntax_vim'


" A solid language pack
Plug 'sheerun/vim-polyglot'

" Syntax for JavaScript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Emmet for vim
Plug 'mattn/emmet-vim'

" Ruby on Rails power tools
Plug 'tpope/vim-rails'

" Tools and environnment to make vim superb for developing with Node.js
Plug 'moll/vim-node'

" Awesome python autocompletion
Plug 'davidhalter/jedi-vim'

" Pandoc integration and utilities
Plug 'vim-pandoc/vim-pandoc'

" Pandoc markdown syntax
Plug 'vim-pandoc/vim-pandoc-syntax'

" The ultimate snippet solution
Plug 'SirVer/ultisnips'

" Snippets files for various languages
Plug 'honza/vim-snippets'


" Adds file type glyphs/icons to popular vim plugins
Plug 'ryanoasis/vim-devicons'


call plug#end()

filetype plugin indent on
syntax on


" ----- General settings -----

set mouse=a
set encoding=utf8
set backspace=indent,eol,start
set ruler
set number
set showcmd
set noshowmode
set incsearch
set hlsearch
set whichwrap+=<,>,h,l,[,]
set foldcolumn=2
set foldmethod=syntax
set foldlevelstart=99
set laststatus=2
set updatetime=500
set ts=2
set sw=2
set expandtab
set colorcolumn=81
highlight ColorColumn ctermbg=238


" ----- Colorscheme -----

colorscheme gruvbox
set background=dark
set t_Co=256
let g:gruvbox_italic=1

" Fix for transparent bg
hi Normal ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE

hi clear SignColumn

" ----- Airline -----

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1


" ----- NerdTree -----

let g:nerdtree_tabs_open_on_console_startup=2
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>


" ----- Easytags -----

set tags=./tags;,~/.vimtags
let g:easytags_dynamic_files=1
let g:easytags_async=1
let g:easytags_resolve_links=1
let g:easytags_suppress_ctags_warning=1

" ----- Tagbar -----

nmap <silent> <leader>b :TagbarToggle<CR>


" ----- Indent guides -----

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
hi IndentGuidesEven ctermbg=236
hi IndentGuidesOdd ctermbg=NONE


" ----- Vim easy align -----

" Start interactive EasyAlign in visual mode
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object
nmap ga <Plug>(EasyAlign)


" ----- GitGutter -----

let g:airline#extensions#hunks#non_zero_only=1


" ----- Limelight -----

let g:limelight_conceal_ctermfg=245
let g:limelight_default_coefficient=0.3
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" ----- Syntastic -----

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = [ 'eslint' ]


" ----- Javascript libraries syntax -----

let g:used_javascript_libs='jquery,underscore,backbone,prelude,angularjs,angularui,angularuirouter,react,flux,requirejs,sugar,jasmine,chai,handlebars,ramda,vue,d3'


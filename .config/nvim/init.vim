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


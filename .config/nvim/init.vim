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


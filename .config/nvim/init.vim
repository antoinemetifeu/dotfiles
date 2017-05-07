" First setting
set nocompatible

filetype off

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" Status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ----- Vim as a programmer's text editor -----------------------------
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug  'vim-syntastic/syntastic'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'vim-scripts/a.vim'

Plug 'nathanaelkane/vim-indent-guides'


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" ----- Working with Git ----------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plug 'Raimondi/delimitMate'

" ----- man pages, tmux -----------------------------------------------
Plug 'jez/vim-superman'
" this plugin actually allows you to view man pages in Vim! Just add the
" text
"
"   vman() {
"     vim -c "SuperMan $*"
"
"     if [ "$?" != "0" ]; then
"       echo "No manual entry for $*"
"     fi
"   }
"
" to your ~/.bashrc, ~/.zshrc, or other config file, and then run
"
"   vman git
"
" to open the man page for git in Vim!
"
" you can also press K on a word in Vim to bring up the man page for that
" word.

Plug 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plug 'jez/vim-c0'
Plug 'jez/vim-ispc'
Plug 'kchmck/vim-coffee-script'
Plug 'ekalinin/Dockerfile.vim'
Plug 'digitaltoad/vim-jade'
Plug 'tpope/vim-liquid'
Plug 'cakebaker/scss-syntax.vim'

Plug 'othree/javascript-libraries-syntax.vim'
Plug 'posva/vim-vue'

" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
Plug 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
Plug 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
Plug 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
Plug 'vim-scripts/HTML-AutoCloseTag'
" Make tmux look like vim-airline (read README for extra instructions)
Plug 'edkolev/tmuxline.vim'
" Most recently used
Plug 'yegappan/mru'
" Use <Tab> for all your insert completion nneds
Plug 'ervandew/supertab'


" Other things
"' colorise le fond d'un code couleur hexa
Plug 'vim-scripts/colorizer'
" comment functions so powerful
Plug 'scrooloose/nerdcommenter'
" inc-/decrement the current value
Plug 'vim-scripts/nextval'
" Color picker
Plug 'KabbAmine/vCoolor.vim'
" emmet
Plug 'mattn/emmet-vim'
" Check file syntax on saving
Plug 'tomtom/checksyntax_vim/'
" vim wrapper for running tests
Plug 'janko-m/vim-test'
" Use sign column to indicate added, modified or removed lines in a file
" that is managed by vcs
Plug 'mhinz/vim-signify'
" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" vim alignment
Plug 'junegunn/vim-easy-align'


" colorschemes
" gruvbox
Plug 'morhetz/gruvbox'
" Solarized colorscheme for vim
" Plug 'altercation/vim-colors-solarized'


Plug 'ryanoasis/vim-devicons'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


" Initialize plugin system
call plug#end()


filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on

" Enable mouse
set mouse=a

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" Use the solarized theme for the Airline status bar
let g:airline_theme='solarized'

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
" autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- jez/vim-superman settings -----
" better man page support
noremap K :SuperMan <cword><CR>


" Highlight 80th column
" set colorcolumn=80
" Always show status bar
set laststatus=2
" let plugins show effects after 500ms, not 4s
set updatetime=500
" Indent size
set ts=2
set sw=2


" Custom indent guide colors
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=dark
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey

" javascript libraries syntax
let g:used_javascript_libs = 'underscore,react,flux,vue'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" vim-devicons
set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
let g:airline_powerline_fonts = 1


" colorschemes

" solarized colorscheme
" let g:solarized_termcolors=256
" syntax enable
" set background=dark
" colorscheme solarized

" gruvbox colorscheme
let g:gruvbox_italic=1 " Enforce displaying italics
" set termguicolors " Support true color terminal
" let g:gruvbox_termcolors=16 " terminal 16-color base colorscheme
colorscheme gruvbox
set background=dark

" Ctrl + c/v to copy/paste
" this will emulate GUI-like Ctrl + c/v when clipboard is setup
nmap <C-c> "+y
nmap <C-v> "+p
vmap <C-c> "+y
vmap <C-v> "+p

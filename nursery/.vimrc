"
" ==================================================
" http://vimawesome.com/
" ==================================================
" cd ~/.vim/bundle
" git clone https://github.com/bling/vim-airline
" git clone https://github.com/kien/rainbow_parentheses.vim
" git clone https://github.com/altercation/vim-colors-solarized.git
" git clone https://github.com/tpope/vim-sensible.git
" git clone https://github.com/tpope/vim-surround.git
" git clone https://github.com/dag/vim-fish
" git clone https://github.com/ekalinin/Dockerfile.vim.git
" git clone https://github.com/chase/vim-ansible-yaml.git"
" git clone https://github.com/tpope/vim-git
" ==================================================
" allow backspacing over everything in insert mode
" set backspace=indent,eol,start

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

" displays line numbers
" set number

" lisp mode for elisp and spacemacs files
au BufNewFile,BufRead *.el set filetype=lisp
au BufNewFile,BufRead .spacemacs set filetype=lisp

" Better Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons

" Solarized
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" leader key
let mapleader = ','

" searching
set ignorecase smartcase incsearch hlsearch

" don't display welcome
set shortmess+=I

" sets how many lines of history VIM has to remember
set history=700

" set to auto read when a file is changed from the outside
set autoread

" always show current position
set ruler

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
"
" ==================================================
" http://vimawesome.com/
" http://bleibinha.us/blog/2013/08/my-vim-setup-for-scala
" ==================================================
" cd ~/.vim/bundle/vim-airline
" git clone https://github.com/bling/vim-airline 
" git clone https://github.com/kien/rainbow_parentheses.vim
" git clone https://github.com/altercation/vim-colors-solarized.git
" git clone https://github.com/derekwyatt/vim-scala
" git clone https://github.com/tpope/vim-sensible.git
" git clone https://github.com/tpope/vim-surround.git
" ==================================================

" allow backspacing over everything in insert mode
" set backspace=indent,eol,start

execute pathogen#infect()
syntax on
filetype plugin indent on

" displays line numbers
" set number

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
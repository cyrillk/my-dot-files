"
" ==================================================
" http://vimawesome.com/
" ==================================================
" cd ~/.vim/bundle
" https://github.com/ekalinin/Dockerfile.vim.git
" https://github.com/scrooloose/nerdcommenter.git
" https://github.com/kien/rainbow_parentheses.vim
" https://github.com/scrooloose/syntastic.git
" https://github.com/bling/vim-airline
" https://github.com/chase/vim-ansible-yaml.git
" https://github.com/altercation/vim-colors-solarized.git
" https://github.com/dag/vim-fish
" https://github.com/tpope/vim-fugitive.git
" https://github.com/tpope/vim-git
" https://github.com/fatih/vim-go.git
" https://github.com/derekwyatt/vim-scala.git
" https://github.com/tpope/vim-sensible.git
" https://github.com/tpope/vim-surround.git
" https://github.com/tpope/vim-unimpaired.git
" ==================================================

" pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

" shell
set noshelltemp
" set shell=/bin/bash

" leader key
let mapleader = ","

" allow backspacing over everything in insert mode
" set backspace=indent,eol,start

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
set history=1024

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

" remove unwanted spaces
autocmd FileType sh autocmd BufWritePre <buffer> :%s/\s\+$//e

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Go
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 1

au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

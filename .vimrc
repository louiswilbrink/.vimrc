"execute pathogen#infect()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'mustache/vim-mustache-handlebars'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'
Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
filetype off

set nocompatible
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set hlsearch
set scrolloff=3
set ruler
set colorcolumn=80
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set t_Co=256
let g:solarized_termcolors=256
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
set number        " Show line numbers
syntax enable     " Use syntax highlighting
set background=dark
colorscheme solarized

au BufNewFile,BufRead *.ejs set filetype=html

" var_dump
imap vrr var_dump(
imap {{{ {%
imap }}} %}
imap <<< <?php
imap >>> ?>
imap clog console.log(

" Easier moving in tabs and windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h


map <F11> <C-W>_<C-W><Bar>
map <F12> <C-W>=

set relativenumber
set number

imap bgc background-color: 
imap bgi background-image: 
imap bgp background-position: 

imap ffam font-family: 
imap fsiz font-size: 
imap lnh line-height: 
imap lsp letter-spacing: 
imap mtt margin-top: 
imap mbb margin-bottom: 
imap mll margin-left: 
imap mrr margin-right: 
imap pll padding-left: 
imap prr padding-right: 
imap ptt padding-top:
imap pbb padding-bottom: 

set pastetoggle=<F2>

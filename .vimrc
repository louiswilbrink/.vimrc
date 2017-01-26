" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'mustache/vim-mustache-handlebars'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'
Bundle 'groenewege/vim-less'
" Jade syntax highlighting.
Bundle 'digitaltoad/vim-jade'
" Scala syntax highlighting.
Plugin 'derekwyatt/vim-scala'
" JavaScript syntax highlighting (including ES2015).
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
filetype plugin on
filetype off

" SETTINGS
set nocompatible
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set hlsearch
" Keep three lines between the cursor and the top/bottom of the window.
set scrolloff=3
" Display current cursor position in bottom right corner.
set ruler
" Mark the 80th character to follow width limits.
set colorcolumn=80
" See relative line numbers.
set relativenumber
" Show current line number on cursor line.
set number
" Toggle -- INSERT (Paste) --
set pastetoggle=<F2>
" When searching for a string, ignore case.
set ignorecase
set clipboard=unnamed

" Enter normal mode using jk
imap jk <ESC>

" Easier moving in tabs and windows
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" CtrlP: Don't search these folders.
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules\|DS_Store\|git\|target\|platform\|plugins' }

" THEME
set t_Co=256
let g:solarized_termcolors=256
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
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


" Full screen the current pane.
map <F11> <C-W>_<C-W><Bar>
" Make all panes the same size.
map <F12> <C-W>=

" ALIASES
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

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

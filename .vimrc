" *** VUNDLE ***
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Search
Bundle 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'

" Syntax highlighting
Bundle 'digitaltoad/vim-pug'
Bundle 'groenewege/vim-less'
Bundle 'altercation/vim-colors-solarized'
Plugin 'derekwyatt/vim-scala'
Plugin 'leafgarland/typescript-vim'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mtdl9/vim-log-highlighting'
Plugin 'stephpy/vim-yaml'

" Functionality
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()

" *** SETTINGS ***

filetype plugin indent on
filetype plugin on
filetype off

set nocompatible
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set hlsearch
set clipboard^=unnamed,unnamedplus "Yank to clipboard.
set scrolloff=3            " Keep three lines between the cursor and the top/bottom of the window.
set ruler                  " Display current cursor position in bottom right corner.
set colorcolumn=80         " Mark the 80th character to follow width limits.
set relativenumber         " See relative line numbers.
set number                 " Show current line number on cursor line.
set pastetoggle=<F2>       " Toggle -- INSERT (Paste) --
set ignorecase             " When searching for a string, ignore case.
set dir=~/.vim             " Keep swap files in .vim -- avoid cluttering codebase.
set t_Co=256               " Set theme color.
set background=dark        " Set theme background.

let g:solarized_termcolors = 256
let g:netrw_bufsettings = 
  \ 'noma nomod nu nobl nowrap ro'
let g:ctrlp_custom_ignore = 
  \ { 
  \   'dir': 'node_modules\|DS_Store\|git\|target\|platform\|plugins' 
  \ }                      " CtrlP: Don't search these folders.

imap jk <ESC>              " Enter normal mode using jk.
imap fd <ESC>              " Enter normal mode using fd.

vmap <C-c> "+yi            " Easier moving in tabs and windows.
vmap <C-x> "+c             " Easier moving in tabs and windows.
vmap <C-v> c<ESC>"+p       " Easier moving in tabs and windows.
imap <C-v> <ESC>"+pa       " Easier moving in tabs and windows.

map <C-J> <C-W>j           " Easier moving in tabs and windows.
map <C-K> <C-W>k           " Easier moving in tabs and windows.
map <C-L> <C-W>l           " Easier moving in tabs and windows.
map <C-H> <C-W>h           " Easier moving in tabs and windows.
map <F11> <C-W>_<C-W><Bar> " Full screen the current pane.
map <F12> <C-W>=           " Make all panes the same size.

syntax enable              " Enable syntax highlighting.
colorscheme solarized      " Use solarized colorscheme.

" *** /SETTINGS ***

au BufNewFile,BufRead *.ejs set filetype=html

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

com! DiffSaved call s:DiffWithSaved()

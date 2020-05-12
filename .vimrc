" *** VUNDLE ***
"
" * Install Vundle *
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" $ vim .
" :PluginInstall
" :BundleInstall

" * Brief help *
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" UltiSnips
Plugin 'SirVer/ultisnips'

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
Plugin 'preservim/nerdcommenter'

" Functionality
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'

" Debug
Plugin 'vim-vdebug/vdebug'

" All of your Plugins must be added before the following line
call vundle#end()

" *** /VUNDLE ***

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

" UltiSnips Settings
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:solarized_termcolors = 256
let g:netrw_bufsettings = 
  \ 'noma nomod nu nobl nowrap ro'

" CtrlP settings.
let g:ctrlp_custom_ignore = 
  \ { 
  \   'dir': 'node_modules\|DS_Store\|git\|target\|platform\|plugins' 
  \ }                      " CtrlP: Don't search these folders.

" Vdebug settings.
if !exists('g:vdebug_options')
  let g:vdebug_options = {}
endif

let g:vdebug_options['server'] = '10.0.0.149'
let g:vdebug_options['port'] = 9090
let g:vdebug_options['ide_key'] = 'vdebug'
let g:vdebug_options['path_maps'] = { '/var/www/html': '/Users/louis.wilbrink/System1/developer.mapquest.com' }

" Enter visual mode.
inoremap jk <ESC>
inoremap jj <ESC>
inoremap jf <ESC>
inoremap fd <ESC>

" Easier moving in tabs and windows.
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Easier moving in tabs and windows.
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Fullscreen current pane.
map <C-n> <C-W>_<C-W><Bar>

" Evenly distribute all panes.
map <C-b> <C-W>=

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

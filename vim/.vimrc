let mapleader = ","
set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'bfrg/vim-cpp-modern'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'pangloss/vim-javascript'

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

call vundle#end()            " required
filetype plugin indent on 
filetype plugin on

let mapleader = "-"
let maplocalleader = "-"

" For problems with backspace
set backspace=indent,eol,start

set term=screen-256color
set background=dark

autocmd BufRead,BufNewFile *.py let python_highlight_all=1

set splitbelow
set splitright

" Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tabs
nnoremap <leader>t :tabedit<CR>
nnoremap <leader>f :find ./
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w!<CR>

" Mov tabs
nnoremap <leader>l :tabm -1<CR>
nnoremap <leader>r :tabm +1<CR>

" Change size of tabs
" vertical
nnoremap L <c-w>>
nnoremap H <c-w><
" horizontal
nnoremap J <c-w>-
nnoremap K <c-w>+

" Insert Mode
inoremap <c-d> <ESC>ddi
inoremap <c-u> <ESC>viwUea
inoremap <c-k> <ESC>F w~ea
inoremap <c-n> <ESC>diwo<ESC>pA

" Leader Maps
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>x :w!<CR>:! compile %<CR>

" Abbreviations
iabbrev @@ lantog0@protonmail.com
iabbrev @n Lucas Antognini

syntax on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set fileformat=unix
set number
set relativenumber
set clipboard=unnamed
set noswapfile

autocmd FileType c,go set shiftwidth=4 softtabstop=4 expandtab tabstop=4

set encoding=utf-8

" Bash like autocomplete
set wildmode=longest,list,full
set wildmenu

" Shiftround, round the spaces to a multiply of shiftwidth
set sr

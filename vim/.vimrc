let mapleader = ","
set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'morhetz/gruvbox'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'gabrielelana/vim-markdown'
Plugin 'reedes/vim-pencil'

call vundle#end()            " required

filetype plugin indent on 
filetype plugin on

let mapleader = "-"
let maplocalleader = "-"

" For problems with backspace
set backspace=indent,eol,start

set term=screen-256color
set background=dark

set splitbelow
set splitright

" Groff
au bufnewfile *.ms 0r /home/near/.vim/groff.temp
au bufread,bufnewfile *.ms filetype detect

" Wrapping
set tw=100

" INSERT MODE
inoremap <c-d> <ESC>ddi
inoremap <c-u> <ESC>viwUea
inoremap <c-k> <ESC>b~ea

" NORMAL MODE
" Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Spaces
nnoremap <CR> o<ESC>k

" Tabs
nnoremap <leader>t :tabedit<CR>
nnoremap <leader>f :find 
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w!<CR>

" Mov tabs
nnoremap <leader>l :tabm -1<CR>
nnoremap <leader>r :tabm +1<CR>

" Change size of tabs
" vertical
nnoremap <leader><leader> <c-w>>
nnoremap <leader>, <c-w><
" horizontal
nnoremap J <c-w>-
nnoremap K <c-w>+

" Leader Maps
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
nnoremap <leader>x :w!<CR>:! compile %<CR>
nnoremap <leader>mw :! chmod +w %<CR>

" files to edit
nnoremap ,e :vsplit $MYVIMRC<CR>
nnoremap ,s :source $MYVIMRC<CR>

nnoremap ,t :set hlsearch!<CR>

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

set hlsearch

" vim finder
set path+=**

" status bar
set laststatus=2

" Text display
set listchars=trail:.,tab:>-,extends:>,precedes:<,nbsp:¬
set list

" keywords
set iskeyword+=-

" colors
colors gruvbox

" camelCase => camel_case
vnoremap ,case :s/\v\C(([a-z]+)([A-Z]))/\2_\l\3/g<CR>

set spell spelllang=es

set statusline=%!MyStatusLine()

" changemewtf
function! MyStatusLine()
    let statusline = ""
    " Filename (F -> full, f -> relative)
    let statusline .= "%f"
    " Buffer flags
    let statusline .= "%( %h%1*%m%*%r%w%) "
    " File format and type
    let statusline .= "(%{&ff}%(\/%Y%))"
    " Left/right separator
    let statusline .= "%="
    " Line & column
    let statusline .= "(%l,%c%V) "
    " Character under cursor (decimal)
    let statusline .= "%03.3b "
    " Character under cursor (hexadecimal)
    let statusline .= "0x%02.2B "
    " File progress
    let statusline .= "| %P/%L"
    return statusline
endfunction

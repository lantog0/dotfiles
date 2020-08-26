let mapleader = ","
set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
"Plugin 'vim-syntastic/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'morhetz/gruvbox'
"Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'gabrielelana/vim-markdown'
"Plugin 'reedes/vim-pencil'

call vundle#end()            " required

filetype plugin indent on
filetype plugin on

let mapleader = "-"
let maplocalleader = "-"

" For problems with backspace
set backspace=indent,eol,start

set term=screen-256color
set background=dark

set fileencodings=utf-8

set splitbelow
set splitright

" INSERT MODE
inoremap <c-d> <ESC>ddi
inoremap <c-u> <ESC>viwUea
inoremap <c-k> <ESC>viwBUea
inoremap <c-U> <ESC>viwUea
"inoremap -- —

autocmd BufRead,BufNewFile *.txt,*.md inoremap -- —

" macrons
imap :a ā
imap :e ē
imap :i ī
imap :o ō
imap :u ū
imap :A Ā
imap :E Ē
imap :I Ī
imap :O Ō
imap :U Ū

" NORMAL MODE
" Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Spaces
nnoremap <CR> o<ESC>k

" Tabs
nnoremap <leader>e :new<CR>
nnoremap <leader>t :tabedit<CR>
nnoremap <leader>f :find
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>n :next<CR>
nnoremap <leader>p :prev<CR>

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

nnoremap mu viwU
nnoremap ml viwu

" Leader Maps
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
nnoremap <leader>x :w!<CR>:! compile %<CR>
nnoremap <leader>mw :! chmod +w %<CR>

" files to edit
nnoremap ,e :vsplit $MYVIMRC<CR>
nnoremap ,s :source $MYVIMRC<CR>

nnoremap ,t :set hlsearch!<CR>
nnoremap ,p :set paste<CR>

nnoremap ,W :w<CR>:e
" output shell
nnoremap ,d :read !date +\%d-\%m-\%Y<CR>

" Abbreviations
iabbrev @@ lantog0@protonmail.com
iabbrev @n Lucas Antognini

vnoremap <C-c> "+y
" input maps
"inoremap ¿ ¿?<Esc>i
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

set encoding=utf-8

" Bash like autocomplete
set wildmode=longest,list,full
set wildmenu

" Shiftround, round the spaces to a multiply of shiftwidth
set sr

"set hlsearch

" vim finder
set path+=**

" status bar
set laststatus=2

" Text display
set listchars=trail:.,tab:>-,extends:>,precedes:<,nbsp:¬
set list

" keywords
set iskeyword+=-

" Options
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_underline = 0
let g:gruvbox_italic = 0
let g:gruvbox_termcolors = 256

" colors
colors default

" Wrapping
"set tw=100
set wrap
set linebreak

" Spelling
"set spell spelllang=es
set nospell

let g:markdown_enable_spell_checking = 0

set statusline=%!MyStatusLine()

autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd VimLeave *.tex !texclear %

map <leader>p :!opout <c-r>%<CR><CR>
map <leader>c :!compiler %<CR><CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

" Updates binds when sxhkdrc is updated
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

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

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

    Plug 'preservim/nerdtree'
    Plug 'dense-analysis/ale'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'flazz/vim-colorschemes'


call plug#end()

" }}}


set nocompatible

filetype on

filetype plugin on

filetype indent on

syntax on 

set number 

set cursorline

set cursorcolumn

colorscheme desert256

set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10

set nowrap
set incsearch

set ignorecase
set smartcase

set showcmd
set showmode
set showmatch

set hlsearch
set history=1000

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

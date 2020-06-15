" Don't attempt to be backwards compatible with vi
set nocompatible

" Enable syntax highlighting
filetype plugin indent on
syntax on

" Show line numbers
set number

" Searching
set hlsearch
set ignorecase
set incsearch
set smartcase
set showmatch
noremap <C-L> :noh<CR><C-L>

" Whitespace
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set shiftround
set autoindent
set smartindent

" Use jk to exit insert mode
inoremap jk <esc>


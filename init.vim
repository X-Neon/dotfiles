call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'

call plug#end()

set background=dark
colorscheme gruvbox

set iskeyword+=-
set formatoptions-=cro

syntax enable
set hidden
set nowrap
set encoding=utf-8
set fileencoding=utf-8
set ruler
set conceallevel=0
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set autoindent
set number
set cursorline
set noshowmode

cmap w!! w !sudo tee > /dev/null %


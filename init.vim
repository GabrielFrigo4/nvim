call plug#begin()
Plug 'tanvirtin/monokai.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
call plug#end()
syntax on
colorscheme monokai

set tabstop=4
set shiftwidth=4
set relativenumber
set mouse=a
set inccommand=split
set ft=nasm

let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit ~\AppData\Local\nvim\init.vim<cr>
nnoremap <leader>sv :source ~\AppData\Local\nvim\init.vim<cr>
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pu :UpdateRemotePlugins<cr>

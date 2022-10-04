call plug#begin()
Plug 'morthetz/gruvbox'
call plug#end()
colorscheme gruvbox
set background=dark

set tabstop=4
set shiftwidth=4
set relativenumber
set mouse=a
set inccommand=split

let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit ~\AppData\Local\nvim\init.vim<cr>
nnoremap <leader>sv :source ~\AppData\Local\nvim\init.vim<cr>

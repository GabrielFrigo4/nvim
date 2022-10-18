call plug#begin()
Plug 'cpea2506/one_monokai.nvim'
"Plug 'tanvirtin/monokai.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
call plug#end()
syntax on
colorscheme one_monokai

set tabstop=4
set shiftwidth=4
set relativenumber
set mouse=a
set inccommand=split
autocmd BufNew,BufRead *.asm set ft=nasm
autocmd BufNew,BufRead *.inc set ft=nasm
autocmd BufNew,BufRead *.s set ft=nasm

let mapleader="\<space>"
nnoremap <leader>; A;<esc>
" linux
"nnoremap <leader>vi :vsplit ~/.config/nvim/init.vim<cr>
"nnoremap <leader>si :source ~/.config/nvim/init.vim<cr>
" windows
nnoremap <leader>vi :vsplit ~\AppData\Local\nvim\init.vim<cr>
nnoremap <leader>si :source ~\AppData\Local\nvim\init.vim<cr>
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pu :UpdateRemotePlugins<cr>

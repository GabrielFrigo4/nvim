call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'fratajczak/one-monokai-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'ARM9/arm-syntax-vim'
Plug 'kylelaker/riscv.vim'
call plug#end()
syntax on
colorscheme one-monokai
set termguicolors
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
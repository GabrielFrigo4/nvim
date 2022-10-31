call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'fratajczak/one-monokai-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
call plug#end()
syntax on
colorscheme one-monokai
set termguicolors
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

set tabstop=4
set shiftwidth=4
set relativenumber
set mouse=a
set inccommand=split
autocmd BufNewFile,BufRead *.asm set ft=nasm
autocmd BufNewFile,BufRead *.inc set ft=nasm
autocmd BufNewFile,BufRead *.s set ft=nasm

function! s:treesitter_init() abort
  " load once
  if exists('g:plug_treesitter_loaded')
    return
  endif
  let g:plug_treesitter_loaded = 1

  " initialize treesitter
  let setup_file = g:plug_home .. '/nvim-treesitter/plugin/nvim-treesitter.lua'
  execute 'luafile' setup_file

  " setup treesitter
lua << EOF
  require('nvim-treesitter.configs').setup({
  	ensure_installed = {"c", "cpp", "lua", "vim"},
    highlight = { enable = true },
    indent = { enable = true },

    -- setup modules
    matchup = { enable = true },
  })
EOF

  " enable treesitter
  TSEnable highlight
endfunction

autocmd BufNewFile,BufRead * call <sid>treesitter_init()

let mapleader="\<space>"
nnoremap <leader>; A;<esc>
" windows
if has('win32')
  nnoremap <leader>vi :vsplit ~\AppData\Local\nvim\init.vim<cr>
  nnoremap <leader>si :source ~\AppData\Local\nvim\init.vim<cr>
endif
" linux
if has('unix')
  nnoremap <leader>vi :vsplit ~/.config/nvim/init.vim<cr>
  nnoremap <leader>si :source ~/.config/nvim/init.vim<cr>
endif
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pu :UpdateRemotePlugins<cr>

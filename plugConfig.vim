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

" enable mouse
" set mouse=a
" set mousemodel=popup
" config text
" set tabstop=4
" set shiftwidth=4
" set relativenumber
" set inccommand=split
" config file extension

" windows
if has('win32')
  " masm
  autocmd BufNewFile,BufRead *.masm set ft=masm
  autocmd BufNewFile,BufRead *.minc set ft=masm
  " nasm
  autocmd BufNewFile,BufRead *.nasm set ft=nasm
  autocmd BufNewFile,BufRead *.ninc set ft=nasm
  " arm
  autocmd BufNewFile,BufRead *.arm set ft=arm
  autocmd BufNewFile,BufRead *.ainc set ft=arm
  " asm
  autocmd BufNewFile,BufRead *.asm set ft=masm
  autocmd BufNewFile,BufRead *.inc set ft=masm
  " gas
  autocmd BufNewFile,BufRead *.s set ft=asm
  autocmd BufNewFile,BufRead *.sinc set ft=asm
  " risc-v
  autocmd BufNewFile,BufRead *.risc set ft=riscv
  autocmd BufNewFile,BufRead *.rinc set ft=riscv
endif

" linux
if has('unix')
  " masm
  autocmd BufNewFile,BufRead *.masm set ft=masm
  autocmd BufNewFile,BufRead *.minc set ft=masm
  " nasm
  autocmd BufNewFile,BufRead *.nasm set ft=nasm
  autocmd BufNewFile,BufRead *.ninc set ft=nasm
  " arm
  autocmd BufNewFile,BufRead *.arm set ft=arm
  autocmd BufNewFile,BufRead *.ainc set ft=arm
  " asm
  autocmd BufNewFile,BufRead *.asm set ft=nasm
  autocmd BufNewFile,BufRead *.inc set ft=nasm
  " gas
  autocmd BufNewFile,BufRead *.s set ft=asm
  autocmd BufNewFile,BufRead *.sinc set ft=asm
  " risc-v
  autocmd BufNewFile,BufRead *.risc set ft=riscv
  autocmd BufNewFile,BufRead *.rinc set ft=riscv
endif

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
  	ensure_installed = {"c", "cpp", "lua", "vim", "python", "bash"},
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

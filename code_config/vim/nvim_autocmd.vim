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
  autocmd BufNewFile,BufRead *.riscv set ft=riscv
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

" config treesitter
autocmd BufNewFile,BufRead * call <sid>treesitter_init()
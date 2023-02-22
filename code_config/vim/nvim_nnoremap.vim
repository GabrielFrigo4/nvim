let mapleader="\<space>"
"nnoremap <leader>; A;<esc>

" windows
"if has('win32')
  "nnoremap <leader>vi :vsplit ~\AppData\Local\nvim\init.vim<cr>
  "nnoremap <leader>si :source ~\AppData\Local\nvim\init.vim<cr>
"endif

" linux
"if has('unix')
  "nnoremap <leader>vi :vsplit ~/.config/nvim/init.vim<cr>
  "nnoremap <leader>si :source ~/.config/nvim/init.vim<cr>
"endif

nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pu :UpdateRemotePlugins<cr>

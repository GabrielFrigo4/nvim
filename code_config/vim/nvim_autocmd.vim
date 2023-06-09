" config file treesitter
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
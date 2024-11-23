-- ################################
-- # Nvim-Lua Vim-Plugins
-- ################################


-- INIT PLUG
Nvim.plug.init()

-- tools
Nvim.plug.get('mg979/vim-visual-multi')

-- languages
Nvim.plug.get('sheerun/vim-polyglot')
Nvim.plug.get('ARM9/arm-syntax-vim')
Nvim.plug.get('kylelaker/riscv.vim')

-- CLOSE PLUG
Nvim.plug.close()

-- option
Nvim.option.termguicolors = true

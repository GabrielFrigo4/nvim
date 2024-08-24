-- ################################
-- # Nvim-Lua Plugins
-- ################################


-- INIT PLUG
Nvim.plug.init()

-- libs
Nvim.plug.get('nvim-tree/nvim-web-devicons')

-- tools
Nvim.plug.get('nvim-tree/nvim-tree.lua')
Nvim.plug.get('mg979/vim-visual-multi')
Nvim.plug.get('stevearc/oil.nvim')

-- languages
Nvim.plug.get('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Nvim.plug.get('sheerun/vim-polyglot')
Nvim.plug.get('ARM9/arm-syntax-vim')
Nvim.plug.get('kylelaker/riscv.vim')
Nvim.plug.get('bfrg/vim-cpp-modern')

-- theme
Nvim.plug.get('bluz71/vim-nightfly-colors', { ['as'] = 'nightfly' })
Nvim.plug.get('joshdick/onedark.vim')

-- CLOSE PLUG
Nvim.plug.close()

-- option
Nvim.option.termguicolors = true

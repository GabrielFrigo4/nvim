-- ################################
-- # Nvim-Lua Plugins
-- ################################


-- init plug
Nvim.plug.init()

-- top plug
Nvim.plug.get('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Nvim.plug.get('bluz71/vim-nightfly-colors', { ['as'] = 'nightfly' })
Nvim.plug.get('nvim-tree/nvim-web-devicons')
Nvim.plug.get('nvim-tree/nvim-tree.lua')
Nvim.plug.get('stevearc/oil.nvim')

-- bottom plug
Nvim.plug.get('terryma/vim-multiple-cursors')
Nvim.plug.get('sheerun/vim-polyglot')
Nvim.plug.get('ARM9/arm-syntax-vim')
Nvim.plug.get('kylelaker/riscv.vim')

-- close plug
Nvim.plug.close()

-- option
Nvim.option.termguicolors = true

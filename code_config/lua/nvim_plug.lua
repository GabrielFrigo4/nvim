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
Nvim.plug.get('nvim-orgmode/orgmode')
Nvim.plug.get('ARM9/arm-syntax-vim')
Nvim.plug.get('kylelaker/riscv.vim')

-- theme
Nvim.plug.get('bluz71/vim-nightfly-colors', { ['as'] = 'nightfly' })
Nvim.plug.get('rebelot/kanagawa.nvim')
Nvim.plug.get('joshdick/onedark.vim')
Nvim.plug.get('Mofiqul/vscode.nvim')

-- CLOSE PLUG
Nvim.plug.close()

-- option
Nvim.option.termguicolors = true

Nvim.plug.init()
Nvim.plug.get('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Nvim.plug.get('terryma/vim-multiple-cursors')
Nvim.plug.get('folke/tokyonight.nvim')
Nvim.plug.get('sheerun/vim-polyglot')
Nvim.plug.get('ARM9/arm-syntax-vim')
Nvim.plug.get('kylelaker/riscv.vim')
Nvim.plug.close()

Nvim.option.termguicolors = true

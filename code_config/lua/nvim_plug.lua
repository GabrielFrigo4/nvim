local function plug_begin()
    Nvim.call('plug#begin')
end

local function plug_end()
    Nvim.call('plug#end')
end

plug_begin()
Nvim.plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Nvim.plug('terryma/vim-multiple-cursors')
Nvim.plug('fratajczak/one-monokai-vim')
Nvim.plug('sheerun/vim-polyglot')
Nvim.plug('ARM9/arm-syntax-vim')
Nvim.plug('kylelaker/riscv.vim')
plug_end()
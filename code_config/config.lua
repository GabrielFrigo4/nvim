-- ################################
-- # Nvim-Lua Configuration
-- ################################


-- nnoremap
Nvim.call.luaFile('nvim_nnoremap', true)

-- plug
Nvim.call.luaFile('nvim_plug', true)
Nvim.call.vimFile('nvim_plug', true)

-- autocmd
Nvim.call.luaFile('nvim_autocmd', true)

-- mouse
Nvim.option.mouse = 'a'
Nvim.option.mousemodel = 'popup'

-- clipboard
Nvim.option.clipboard:append('unnamed', 'unnamedplus')

-- cursor
Nvim.option.guicursor = ''

-- text tab
Nvim.option.autoindent = true
Nvim.option.expandtab = true
Nvim.option.copyindent = true
Nvim.option.preserveindent = true
Nvim.option.softtabstop = 0
Nvim.option.shiftwidth = 4
Nvim.option.tabstop = 4

-- gui / cli
Nvim.option.relativenumber = true
Nvim.option.inccommand = 'split'

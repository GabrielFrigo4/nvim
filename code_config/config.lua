-- nnoremap
Nvim.call.luaFile('nvim_nnoremap', true)

-- plug
Nvim.call.luaFile('nvim_plug', true)
Nvim.call.vimFile('nvim_plug', true)

-- mouse
Nvim.option.mouse = 'a'
Nvim.option.mousemodel = 'popup'

-- clipboard
Nvim.option.clipboard:append('unnamed', 'unnamedplus')

-- cursor
Nvim.option.guicursor = ''

-- text
Nvim.option.tabstop = 4
Nvim.option.shiftwidth = 4
Nvim.option.relativenumber = true
Nvim.option.inccommand = 'split'

-- autocmd
Nvim.call.luaFile('nvim_autocmd', true)

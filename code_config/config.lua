-- plug
Nvim.call.luaFile('nvim_plug', true)
Nvim.call.vimFile('nvim_plug', true)

-- enable mouse
Nvim.option.mouse = 'a'
Nvim.option.mousemodel = 'popup'

-- config text
Nvim.option.tabstop = 4
Nvim.option.shiftwidth = 4
Nvim.option.relativenumber = true
Nvim.option.inccommand = 'split'

-- autocmd
Nvim.call.luaFile('nvim_autocmd', true)

-- nnoremap
Nvim.call.luaFile('nvim_nnoremap', true)

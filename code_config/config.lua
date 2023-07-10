-- plug
Nvim.callLuaFile('nvim_plug', true)
Nvim.callVimFile('nvim_plug', true)

-- enable mouse
Nvim.option.mouse = 'a'
Nvim.option.mousemodel = 'popup'

-- config text
Nvim.option.tabstop = 4
Nvim.option.shiftwidth = 4
Nvim.option.relativenumber = true
Nvim.option.inccommand = 'split'

-- autocmd
Nvim.callLuaFile('nvim_autocmd', true)

-- nnoremap
Nvim.callLuaFile('nvim_nnoremap', true)

-- plug
Nvim.callVimFile('nvim_plug', true)

-- enable mouse
vim.opt.mouse = 'a'
vim.opt.mousemodel = 'popup'

-- config text
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.relativenumber = true
vim.opt.inccommand = 'split'

-- autocmd
Nvim.callVimFile('nvim_autocmd', true)

-- nnoremap
Nvim.callVimFile('nvim_autocmd', true)
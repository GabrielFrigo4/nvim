local set = vim.opt

-- plug
vim.cmd 'source ~\\AppData\\Local\\nvim\\plugConfig.vim'

-- enable mouse
set.mouse = 'a'
set.mousemodel = 'popup'

-- config text
set.tabstop = 4
set.shiftwidth = 4
set.relativenumber = true
set.inccommand = 'split'
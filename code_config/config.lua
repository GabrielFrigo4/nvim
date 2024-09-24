-- ################################
-- # Nvim-Lua Configuration
-- ################################


-- mapping
Nvim.call.luaFile('nvim_mapping', true)
Nvim.call.vimFile('nvim_mapping', true)

-- plug
Nvim.call.luaFile('nvim_plug', true)
Nvim.call.vimFile('nvim_plug', true)

-- autocmd
Nvim.call.luaFile('nvim_autocmd', true)

-- keys
Nvim.option.backspace:append('indent', 'eol', 'start')
Nvim.option.whichwrap:append('<>hl[]')

-- mouse
Nvim.option.mouse = 'a'
Nvim.option.mousemodel = 'popup'

-- clipboard
Nvim.guioption = 'adegmrLT'
Nvim.option.clipboard:append('unnamed', 'unnamedplus')

-- cursor
Nvim.option.cursorcolumn = true
Nvim.option.cursorline = true

-- indent
Nvim.option.preserveindent = true
Nvim.option.autoindent = true
Nvim.option.copyindent = true

-- tab
Nvim.option.expandtab = false
Nvim.option.softtabstop = 0
Nvim.option.shiftwidth = 4
Nvim.option.tabstop = 4

-- text
Nvim.option.smartcase = true
Nvim.option.encoding = 'UTF-8'

-- gui / cli
Nvim.option.relativenumber = true
Nvim.option.inccommand = 'split'

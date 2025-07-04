-- ################################
-- # Nvim-Lua Configuration
-- ################################


-- polyglot
Nvim.global.polyglot_disabled = {'ftdetect', 'ada'}

-- plug
Nvim.call.file.lua('nvim_plug', true)

-- lazy
Nvim.call.file.lua('nvim_lazy', true)

-- mapping
Nvim.call.file.lua('nvim_mapping', true)
Nvim.call.file.vim('nvim_mapping', true)

-- clipboard
Nvim.call.file.lua('nvim_clipboard', true)

-- autocmd
Nvim.call.file.lua('nvim_autocmd', true)

-- treesitter
Nvim.call.file.lua('nvim_treesitter', true)

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
Nvim.option.softtabstop = 4
Nvim.option.shiftwidth = 4
Nvim.option.tabstop = 4

-- text
Nvim.option.smartcase = true
Nvim.option.encoding = 'UTF-8'

-- gui / cli
Nvim.option.relativenumber = true
Nvim.option.inccommand = 'split'

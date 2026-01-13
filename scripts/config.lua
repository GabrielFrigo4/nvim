-- ============================================================================
--  Nvim-Lua Configuration
-- ============================================================================
-- {{{

-- polyglot
Nvim.global.polyglot_disabled = { 'ftdetect', 'ada' }

-- }}}

-- ============================================================================
--  Core & Plugins
-- ============================================================================
-- {{{

-- plug
Nvim.call.file.lua('nvim_plug', true)

-- lazy
Nvim.call.file.lua('nvim_lazy', true)

-- mapping
Nvim.call.file.lua('nvim_mapping', true)

-- clipboard
Nvim.call.file.lua('nvim_clipboard', true)

-- autocmd
Nvim.call.file.lua('nvim_autocmd', true)

-- treesitter
Nvim.call.file.lua('nvim_treesitter', true)

-- lsp
Nvim.call.file.lua('nvim_lsp', true)

-- }}}

-- ============================================================================
--  Input & Navigation
-- ============================================================================
-- {{{

-- backspace
Nvim.keymap.set('n', '<Backspace>', function()
    if Nvim.func.col('.') == 1 then
        return 'kgJ'
    else
        return 'X'
    end
end, { expr = true, replace_keycodes = true, desc = "Smart Backspace" })

-- keys
Nvim.option.backspace:append('indent', 'eol', 'start')
Nvim.option.whichwrap:append('<>hl[]')

-- mouse
Nvim.option.mouse = 'a'
Nvim.option.mousemodel = 'popup'

-- }}}

-- ============================================================================
--  UI & Visuals
-- ============================================================================
-- {{{

-- clipboard
Nvim.guioption = 'adegmrLT'
Nvim.option.clipboard:append('unnamed', 'unnamedplus')

-- cursor
Nvim.option.cursorcolumn = true
Nvim.option.cursorline = true

-- cursor style
local cursor_group = Nvim.api.nvim_create_augroup('ConfigCursor', { clear = true })
Nvim.api.nvim_create_autocmd({ 'VimEnter', 'VimResume' }, {
    group = cursor_group,
    pattern = '*',
    command = 'set guicursor=n-c:block,i-ci-ve:ver10,r-v:hor10,a:blinkwait500-blinkoff500-blinkon500-Cursor/lCursor'
})
Nvim.api.nvim_create_autocmd({ 'VimLeave', 'VimSuspend' }, {
    group = cursor_group,
    pattern = '*',
    command = 'set guicursor='
})

-- gui / cli
Nvim.option.relativenumber = true
Nvim.option.inccommand = 'split'

-- }}}

-- ============================================================================
--  Formatting & Text
-- ============================================================================

-- {{{

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

-- folding (vimscript)
local ft_vim_grp = Nvim.api.nvim_create_augroup('FileTypeVim', { clear = true })
Nvim.api.nvim_create_autocmd('FileType', {
    group = ft_vim_grp,
    pattern = 'vim',
    callback = function()
        Nvim.opt_local.foldmethod = 'marker'
    end
})

-- }}}

-- local var
local map = vim.api.nvim_set_keymap
local set = vim.opt
local nvim = {
    isWin = vim.fn.has('win32'),
    isUnix = vim.fn.has('unix'),
    path = {
        win = '~\\AppData\\Local\\nvim\\config\\',
        unix = '~\\.config\\nvim\\config\\',
        current = nil
    }
}
if nvim.isWin then
    nvim.path.current = nvim.path.win
elseif nvim.isUnix then
    nvim.path.current = nvim.path.unix
end

-- plug
vim.cmd('source '..nvim.path.current..'nvim_plug.vim')

-- enable mouse
set.mouse = 'a'
set.mousemodel = 'popup'

-- config text
set.tabstop = 4
set.shiftwidth = 4
set.relativenumber = true
set.inccommand = 'split'

-- autocmd
vim.cmd('source '..nvim.path.current..'nvim_autocmd.vim')

-- nnoremap
vim.cmd('source '..nvim.path.current..'nvim_nnoremap.vim')
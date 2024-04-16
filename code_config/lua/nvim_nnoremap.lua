Nvim.global.mapleader = '\\'
Nvim.global.maplocalleader = Nvim.global.mapleader

local function nrmap(shortcut, command)
    Nvim.keymap.set('', shortcut, command, { noremap = true, silent = true })
end

-- Link Navigate Shortcut
nrmap('<M-.>', '<C-]>')
nrmap('<M-,>', '<C-o>')

-- Window Navigate Shortcut
nrmap('<S-tab>', '<C-w>w')
nrmap('<M-up>', '<C-w><up>')
nrmap('<M-down>', '<C-w><down>')
nrmap('<M-left>', '<C-w><left>')
nrmap('<M-right>', '<C-w><right>')

-- Plug Shortcut
nrmap('<leader>pi', ':PlugInstall<cr>')
nrmap('<leader>pu', ':PlugUpdate<cr>')
nrmap('<leader>urp', ':UpdateRemotePlugins<cr>')

-- NvimTree Shortcut
nrmap('<C-\\>', ':NvimTreeToggle<cr>')

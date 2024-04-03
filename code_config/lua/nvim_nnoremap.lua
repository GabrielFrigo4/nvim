Nvim.global.mapleader = '+'
Nvim.global.maplocalleader = Nvim.global.mapleader

local function nrmap(shortcut, command)
    Nvim.keymap('', shortcut, command, { noremap = true, silent = true })
end

nrmap('<C-\\>', ':NvimTreeToggle<cr>')
nrmap('<leader>pi', ':PlugInstall<cr>')
nrmap('<leader>pu', ':PlugUpdate<cr>')
nrmap('<leader>urp', ':UpdateRemotePlugins<cr>')

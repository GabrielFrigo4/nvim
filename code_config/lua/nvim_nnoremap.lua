Nvim.grab.mapleader = ' '
Nvim.grab.maplocalleader = Nvim.grab.mapleader

local function rmap(shortcut, command)
    Nvim.keymap('', shortcut, command, { noremap = true, silent = true })
end

rmap('<leader>pi', ':PlugInstall<cr>')
rmap('<leader>pu', ':UpdateRemotePlugins<cr>')
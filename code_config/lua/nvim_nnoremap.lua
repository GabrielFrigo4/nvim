Nvim.global.mapleader = ' '
Nvim.global.maplocalleader = Nvim.global.mapleader

local function rmap(shortcut, command)
    Nvim.keymap('', shortcut, command, { noremap = true, silent = true })
end

rmap('<leader>pi', ':PlugInstall<cr>')
rmap('<leader>pu', ':PlugUpdate<cr>')
rmap('<leader>urp', ':UpdateRemotePlugins<cr>')

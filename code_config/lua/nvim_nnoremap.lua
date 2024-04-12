Nvim.global.mapleader = '\\'
Nvim.global.maplocalleader = Nvim.global.mapleader

local function nrmap(shortcut, command)
    Nvim.keymap.set('', shortcut, command, { noremap = true, silent = true })
end

-- Only work on Windows
--nrmap('<C-.>', '<C-]>')
--nrmap('<C-,>', '<C-o>')

-- Work on Windows and Linux
nrmap('<M-.>', '<C-]>')
nrmap('<M-,>', '<C-o>')
--nrmap('<leader>.', '<C-]>')
--nrmap('<leader>,', '<C-o>')
nrmap('<leader>pi', ':PlugInstall<cr>')
nrmap('<leader>pu', ':PlugUpdate<cr>')
nrmap('<leader>urp', ':UpdateRemotePlugins<cr>')
nrmap('<C-\\>', ':NvimTreeToggle<cr>')

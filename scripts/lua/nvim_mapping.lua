-- ################################
-- # Nvim-Lua Mapping
-- ################################


-- MapLeader
Nvim.global.mapleader = '\\'
Nvim.global.maplocalleader = Nvim.global.mapleader

-- NNoReMap Function
local function nrmap(shortcut, command, description)
    Nvim.keymap.set('', shortcut, command, { desc = description, noremap = true, silent = true })
end

-- Link Navigate Shortcut
nrmap('<M-.>', '<C-]>')
nrmap('<M-,>', '<C-o>')

-- Window Navigate Shortcut
nrmap('<S-tab>', '<C-w>w')
nrmap('<M-]>', '<C-w>w')
nrmap(';', '<C-w>w')
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
nrmap('<M-[>', ':NvimTreeToggle<cr>')
nrmap(',', ':NvimTreeToggle<cr>')

-- Telescope Shortcut
local builtin = require('telescope.builtin')
nrmap('<C-t>f', builtin.find_files, 'Telescope Find Files')
nrmap('<C-t>g', builtin.live_grep, 'Telescope Live Grep')
nrmap('<C-t>b', builtin.buffers, 'Telescope Buffers')
nrmap('<C-t>t', builtin.help_tags, 'Telescope Help Tags')

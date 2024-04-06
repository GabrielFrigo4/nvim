-- Config file extension
local function setExtCmd(extension, command)
    Nvim.autocmd({ 'BufNewFile', 'BufRead' }, {
        pattern = extension,
        command = command
    })
end

local function setListExtCmd(list)
    for i = 1, #list, 1 do
        local extCmd = list[i]
        setExtCmd(extCmd[1], extCmd[2])
    end
end

-- TreeSitter
local treesitter = require('nvim-treesitter.configs')
treesitter.setup({
    ensure_installed = {
        "c", "cpp", "c_sharp", "lua", "rust", "go", "java", "python", "zig", "javascript", -- Languages
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",             -- GIT
        "cuda", "glsl", "hlsl",                                                            -- GPU
        "vimdoc", "vim",                                                                   -- VIM
        "yaml", "toml",                                                                    -- Data
        "make", "cmake",                                                                   -- Make
        "bash", "sql", "arduino",                                                          -- Other
    },
    highlight = { enable = true },
    indent = { enable = true },

    -- setup modules
    matchup = { enable = true },
})

-- NvimTree
local nvimtree = require('nvim-tree')
nvimtree.setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                item = "│ ",
                none = "  ",
            },
        },
    },
    filters = {
        dotfiles = false,
    },
})

-- OilNvim
local oil = require('oil')
oil.setup()

-- INTEL X86 SINTAX
local x86 = {
    { { '*.x86', '*.xinc' },  'set ft=asm' },  --GAS
    { { '*.masm', '*.minc' }, 'set ft=masm' }, -- MASM
    { { '*.nasm', '*.ninc' }, 'set ft=nasm' }, -- NASM
    { { '*.fasm', '*.finc' }, 'set ft=fasm' }, -- FASM
    { { '*.s', '*.sinc' },    'set ft=asm' },  -- GAS
    { { '*.S', '*.Sinc' },    'set ft=asm' }   -- GAS
}
setListExtCmd(x86)

-- ARM SINTAX
local arm = {
    { { '*.arm', '*.ainc' }, 'set ft=arm' }
}
setListExtCmd(arm)

-- RISC-V SINTAX
local riscv = {
    { { '*.riscv', '*.rinc' }, 'set ft=riscv' }
}
setListExtCmd(riscv)

-- Windows
if Nvim.isWin then
    -- ASM
    setExtCmd({ '*.asm', '*.inc' }, 'set ft=masm')
end

-- Linux
if Nvim.isUnix then
    -- ASM
    setExtCmd({ '*.asm', '*.inc' }, 'set ft=nasm')
end

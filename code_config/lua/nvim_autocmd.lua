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

local treesitter = require('nvim-treesitter.configs')
treesitter.setup({
    ensure_installed = {
        "c", "cpp", "c_sharp", "lua", "rust", "java", "python", "zig", "javascript", -- languages
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",       -- github
        "vim", "bash", "arduino",
        "cuda", "glsl", "hlsl",
        "yaml", "toml",
        "make", "cmake",
    },
    highlight = { enable = true },
    indent = { enable = true },

    -- setup modules
    matchup = { enable = true },
})

-- INTEL X86 SINTAX
local x86 = {
    { { '*.masm', '*.minc' }, 'set ft=masm' }, -- MASM
    { { '*.nasm', '*.ninc' }, 'set ft=nasm' }, -- NASM
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
    { { '*.asm', '*.inc' }, 'set ft=masm' }
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

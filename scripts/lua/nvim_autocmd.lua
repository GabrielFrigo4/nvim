-- ################################
-- # Nvim-Lua AutoCommand
-- ################################


-- AutoCommand Function
local function setExtCmd(extension, command)
    Nvim.autocmd({ 'BufNewFile', 'BufRead' }, {
        pattern = extension,
        command = command,
    })
end

local function setListExtCmd(list)
    for i = 1, #list, 1 do
        local extCmd = list[i]
        setExtCmd(extCmd[1], extCmd[2])
    end
end


-- ################################
-- # Nvim-Lua Sintax
-- ################################


-- INTEL X86 SINTAX
local x86 = {
    { { '*.x86', '*.x64', '*.xinc' }, 'set ft=asm' },  -- GAS
    { { '*.masm', '*.minc' },         'set ft=masm' }, -- MASM
    { { '*.nasm', '*.ninc' },         'set ft=nasm' }, -- NASM
    { { '*.fasm', '*.finc' },         'set ft=fasm' }, -- FASM
    { { '*.s', '*.i' },               'set ft=asm' },  -- GAS
    { { '*.S', '*.I' },               'set ft=asm' },  -- GAS
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


-- ################################
-- # Nvim-Lua Tab Indent
-- ################################


-- Tab Indent
local tabs = {
    -- Organization
    '.org', '.norg',
    -- Assembly
    '*.asm', '*.inc',
    '*.masm', '*.minc',
    '*.nasm', '*.ninc',
    '*.fasm', '*.finc',
    '*.s', '*.i',
    '*.S', '*.I',
    '*.x86', '*.x64', '*.xinc',
    '*.arm', '*.ainc',
    '*.riscv', '*.rinc',
    -- Python
    '*.py', '.pyw',
    -- Lua
    '*.lua', '*.wlua',
    -- Rust
    '*.rs',
    -- Zig
    '*.zig',
}
setExtCmd(tabs, 'set noet ci pi sts=4 sw=4 ts=4')

-- Config file extension
local function setExtCmd(extension, command)
    Nvim.autocmd({'BufNewFile', 'BufRead'} ,{
        pattern = extension,
        command = command
    })
end

local treesitter = require('nvim-treesitter.configs')
treesitter.setup({
	ensure_installed = {"c", "cpp", "cs", "lua", 
        "rust", "java", "vim", "python", "bash"},
	highlight = { enable = true },
	indent = { enable = true },

	-- setup modules
	matchup = { enable = true },
})

-- MASM
setExtCmd({'*.masm', '*.minc'}, 'set ft=masm')
-- NASM
setExtCmd({'*.nasm', '*.ninc'}, 'set ft=nasm')
-- ARM
setExtCmd({'*.arm', '*.ainc'}, 'set ft=arm')
-- GAS
setExtCmd({'*.s', '*.sinc'}, 'set ft=asm')
-- RISC-V
setExtCmd({'*.riscv', '*.rinc'}, 'set ft=riscv')

-- Windows
if Nvim.isWin then
    -- ASM
    setExtCmd({'*.asm', '*.inc'}, 'set ft=masm')
end

-- Linux
if Nvim.isUnix then
    -- ASM
    setExtCmd({'*.asm', '*.inc'}, 'set ft=nasm')
end

-- ################################
-- # Nvim-Treesitter
-- ################################


-- 
local grammars = {
    -- Languages (ASM)
    "asm", "nasm",
    -- Languages (BIN)
    "c", "cpp", "zig", "rust", "go",
    -- Languages (JIT)
    "c_sharp", "java",
    -- Languages (VM)
    "python", "lua", "javascript",
    -- GIT
    "git_config", "git_rebase", "gitattributes",
    "gitcommit", "gitignore",
    -- GPU
    "cuda", "glsl", "hlsl",
    -- CPU
    "verilog", "vhdl",
    -- VIM
    "vimdoc", "vim",
    -- Make
    "make", "cmake",
    -- Data
    "yaml", "toml", "xml", "json",
    -- Organization
    "org", "norg",
    -- Other
    "bash", "sql", "arduino"
}

-- 
local ts_install = require('nvim-treesitter.install').commands.TSInstall['run!']

--
local function tree_sitter_install()
    for _, grammar in ipairs(grammars) do
        ts_install(grammar)
    end
end

Nvim.api.nvim_create_user_command('TreeSitterInstall', tree_sitter_install,
  {nargs = 0, desc = 'Install TreeSitter Grammars'}
)
-- ============================================================================
--  Nvim-Treesitter
-- ============================================================================
-- {{{

-- Grammars List
local grammars = {
    -- Languages (ASM)
    "asm", "nasm",
    -- Languages (BIN)
    "c", "cpp", "zig", "rust", "go", "ada", "haskell",
    -- Languages (JIT)
    "c_sharp", "java",
    -- Languages (VM)
    "python", "lua", "commonlisp",
    -- Languages (WEB)
    "javascript", "typescript", "tsx", "html", "css",
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
    "norg", "markdown",
    -- Other
    "bash", "sql", "arduino"
}

-- TSInstall Lua Function
local ts_install = require('nvim-treesitter.install').commands.TSInstall['run!']

-- TreeSitterInstall Lua Function
local function tree_sitter_install()
    for _, grammar in ipairs(grammars) do
        ts_install(grammar)
    end
end

-- Create TreeSitterInstall User Command
Nvim.api.nvim_create_user_command('TreeSitterSetup', tree_sitter_install,
    { nargs = 0, desc = 'Setup TreeSitter Grammars' }
)

-- }}}

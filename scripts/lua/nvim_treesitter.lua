-- ============================================================================
--  Nvim-Treesitter
-- ============================================================================
-- {{{

-- Grammars List
local grammars = {
    -- Languages (MCU)
    "arduino",
    -- Languages (ASM)
    "asm", "nasm",
    -- Languages (CPU)
    "c", "cpp", "zig", "rust", "go", "ada", "haskell",
    -- Languages (JIT)
    "c_sharp", "java", "erlang",
    -- Languages (VM)
    "python", "lua", "commonlisp",
    -- Languages (WEB)
    "javascript", "typescript", "tsx", "html", "css",
    -- Languages (GPU)
    "cuda", "glsl", "hlsl",
    -- Languages (FPGA)
    "verilog", "vhdl",
    -- Build System (MAKE)
    "make", "cmake",
    -- Repository (GIT)
    "git_config", "git_rebase", "gitattributes",
    "gitcommit", "gitignore",
    -- Serialize (DATA)
    "yaml", "toml", "xml", "json",
    -- Configuration (VIM)
    "vimdoc", "vim",
    -- Organization (ORG)
    "markdown", "markdown_inline",
    "mermaid", "latex", "norg",
    -- Scripting (SH)
    "bash",
    -- Database (DB)
    "sql"
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

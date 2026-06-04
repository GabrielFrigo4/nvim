-- ============================================================================
--  Nvim-Treesitter
-- ============================================================================
-- {{{

local grammars = {
	"arduino",
	"asm", "nasm",
	"c", "cpp", "zig", "rust", "go", "ada", "haskell",
	"c_sharp", "java", "scala", "clojure", "erlang",
	"python", "lua", "commonlisp",
	"javascript", "typescript", "tsx", "html", "css",
	"cuda", "glsl", "hlsl",
	"verilog", "vhdl",
	"make", "cmake",
	"git_config", "git_rebase", "gitattributes",
	"gitcommit", "gitignore",
	"yaml", "toml", "xml", "json",
	"vimdoc", "vim",
	"markdown", "markdown_inline",
	"mermaid", "latex", "norg",
	"bash",
	"sql"
}

local function tree_sitter_install()
	require('nvim-treesitter').install(grammars)
end

Nvim.api.nvim_create_user_command('TreeSitterSetup', tree_sitter_install,
	{ nargs = 0, desc = 'Setup TreeSitter Grammars' }
)

-- }}}

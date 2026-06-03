-- ============================================================================
--  Nvim-Treesitter
-- ============================================================================
-- {{{

local grammars = {
	"arduino",
	"asm", "nasm",
	"c", "cpp", "zig", "rust", "go", "ada", "haskell",
	"c_sharp", "java", "erlang",
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
	require('nvim-treesitter.install').compilers = { "gcc", "clang", "cc" }
	require('nvim-treesitter.install').prefer_git = false
	require('nvim-treesitter.install').ts_generate_args = { "generate" }
	
	local ts_install = require('nvim-treesitter.install').commands.TSInstall['run!']
	for _, grammar in ipairs(grammars) do
		ts_install(grammar)
	end
end

Nvim.api.nvim_create_user_command('TreeSitterSetup', tree_sitter_install,
	{ nargs = 0, desc = 'Setup TreeSitter Grammars' }
)

-- }}}

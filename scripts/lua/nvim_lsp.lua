-- ============================================================================
--  Nvim-LSP
-- ============================================================================
-- {{{

-- LSP Server List
local servers = {
	-- Languages (ASM)
	"asm_lsp",
	-- Languages (BIN)
	"zls", "rust_analyzer", "gopls",
	-- Languages (JIT)
	"jdtls",
	-- Languages (VM)
	"pyright", "lua_ls",
	-- Languages (WEB)
	"ts_ls", "html", "cssls",
	-- Make
	"neocmake",
	-- Data
	"yamlls", "lemminx", "jsonls",
	-- Other
	"bashls", "sqlls",
}

-- Default Capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Mason LSP Server Setup Lua Function
local function mason_lsp_setup()
	-- Mason Setup
	require("mason-lspconfig").setup({
		ensure_installed = servers,
		handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities
				})
			end,
		}
	})
end

-- Clangd LSP Server Setup Lua Function
local function clangd_lsp_setup()
	if Nvim.func.executable("clangd") == 0 then return end

	local fts = { "c", "cpp", "objc", "objcpp", "cuda" }
	Nvim.api.nvim_create_autocmd("FileType", {
		pattern = fts,
		callback = function(ev)
			Nvim.lsp.start({
				name = "clangd",
				cmd = { "clangd" },
				root_dir = Nvim.filesys.root(ev.buf, { ".git", "Makefile", "compile_commands.json" }),
				capabilities = capabilities,
			}, { bufnr = ev.buf, reuse_client = true })
		end,
	})
	if vim.tbl_contains(fts, vim.bo.filetype) then
		Nvim.cmd("doautocmd FileType")
	end
end

-- LSP Server Setup Lua Function
local function lsp_setup()
	mason_lsp_setup()
	clangd_lsp_setup()
end

-- Create LSPSetupMason User Command
Nvim.api.nvim_create_user_command('LSPSetupMason', mason_lsp_setup,
	{ nargs = 0, desc = 'Mason LSP Servers' }
)

-- Create LSPSetupClangd User Command
Nvim.api.nvim_create_user_command('LSPSetupClangd', clangd_lsp_setup,
	{ nargs = 0, desc = 'Clangd LSP Server' }
)

-- Create LSPSetup User Command
Nvim.api.nvim_create_user_command('LSPSetup', lsp_setup,
	{ nargs = 0, desc = 'LSP Servers' }
)

-- }}}

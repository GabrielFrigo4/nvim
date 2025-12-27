-- ============================================================================
--  Nvim-LSP
-- ============================================================================
-- {{{

-- Server List
local servers = {
	-- Languages (ASM)
	"asm_lsp",
	-- Languages (BIN)
	"clangd", "zls", "rust_analyzer", "gopls",
	-- Languages (JIT)
	"jdtls",
	-- Languages (VM)
	"pyright", "lua_ls",
	-- Languages (WEB)
	"ts_ls", "html", "cssls",
	-- Build System (MAKE)
	"neocmake",
	-- Data
	"yamlls", "lemminx", "jsonls",
	-- Other
	"bashls", "sqlls",
}

local ft_map = {
	-- Languages (ASM)
	asm_lsp       = { "asm", "vmasm", "nasm" },
	-- Languages (BIN)
	clangd        = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	zls           = { "zig", "zir" },
	rust_analyzer = { "rust" },
	gopls         = { "go", "gomod", "gowork", "gotmpl" },
	-- Languages (JIT)
	jdtls         = { "java" },
	-- Languages (VM)
	pyright       = { "python" },
	lua_ls        = { "lua" },
	-- Languages (WEB)
	ts_ls         = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	html          = { "html" },
	cssls         = { "css", "scss", "less" },
	-- Build System (MAKE)
	neocmake      = { "cmake" },
	-- Data
	yamlls        = { "yaml" },
	lemminx       = { "xml" },
	jsonls        = { "json", "jsonc" },
	-- Other
	bashls        = { "sh", "bash" },
	sqlls         = { "sql", "mysql" },
}

local mason_map = {
	-- Languages (ASM)
	["asm_lsp"]       = "asm-lsp",
	-- Languages (BIN)
	["clangd"]        = "clangd",
	["zls"]           = "zls",
	["rust_analyzer"] = "rust-analyzer",
	["gopls"]         = "gopls",
	-- Languages (JIT)
	["jdtls"]         = "jdtls",
	-- Languages (VM)
	["pyright"]       = "pyright",
	["lua_ls"]        = "lua-language-server",
	-- Languages (WEB)
	["ts_ls"]         = "typescript-language-server",
	["html"]          = "html-lsp",
	["cssls"]         = "css-lsp",
	-- Build System (MAKE)
	["neocmake"]      = "neocmakelsp",
	-- Data
	["yamlls"]        = "yaml-language-server",
	["lemminx"]       = "lemminx",
	["jsonls"]        = "json-lsp",
	-- Other
	["bashls"]        = "bash-language-server",
	["sqlls"]         = "sqlls",
}

local binary_map = {
	-- Languages (ASM)
	["asm_lsp"]       = "asm-lsp",
	-- Languages (BIN)
	["clangd"]        = "clangd",
	["zls"]           = "zls",
	["rust_analyzer"] = "rust-analyzer",
	["gopls"]         = "gopls",
	-- Languages (JIT)
	["jdtls"]         = "jdtls",
	-- Languages (VM)
	["pyright"]       = "pyright-langserver",
	["lua_ls"]        = "lua-language-server",
	-- Languages (WEB)
	["ts_ls"]         = "typescript-language-server",
	["html"]          = "vscode-html-language-server",
	["cssls"]         = "vscode-css-language-server",
	-- Build System (MAKE)
	["neocmake"]      = "neocmakelsp",
	-- Data
	["yamlls"]        = "yaml-language-server",
	["lemminx"]       = "lemminx",
	["jsonls"]        = "vscode-json-language-server",
	-- Other
	["bashls"]        = "bash-language-server",
	["sqlls"]         = "sql-language-server",
}

local default_caps = require('cmp_nvim_lsp').default_capabilities()

-- }}}

-- ============================================================================
--  Custom Configurations
-- ============================================================================
-- {{{

local server_configs = {
	clangd = {
		cmd = { "clangd", "--background-index", "--clang-tidy" },
		root_dir = function(fname)
			return Nvim.filesys.root(fname, { ".git", "Makefile", "compile_commands.json" })
		end,
	},

	lua_ls = {
		settings = {
			Lua = { diagnostics = { globals = { 'vim', 'Nvim' } } }
		},
	},

	asm_lsp = {
		settings = {
			assembler = {
				name = "nasm",
				file_types = { "s", "S", "asm", "inc", "nasm", "ninc" }
			},
			instruction = {
				syntax = "intel"
			},
		},
		handlers = {
			["window/showMessage"] = function(err, result, ctx, config)
				if result and result.message and result.message:find("No .asm-lsp.toml", 1, true) then
					return
				end
				vim.lsp.handlers["window/showMessage"](err, result, ctx, config)
			end,
		},
	},
}

-- }}}

-- ============================================================================
--  Functions
-- ============================================================================
-- {{{

local function get_mason_name(name)
	return mason_map[name] or name
end

local function get_binary_name(name)
	return binary_map[name] or name
end

local function is_system_available(name)
	local bin = get_binary_name(name)
	return Nvim.func.executable(bin) == 1
end

local function is_mason_available(name)
	local registry = require("mason-registry")
	local mason_name = get_mason_name(name)
	local ok, pkg = pcall(registry.get_package, mason_name)
	return ok and pkg and pkg:is_installed()
end

local function resolve_server_availability(name)
	if is_system_available(name) then
		return true
	end
	return is_mason_available(name)
end

local function build_opts(name)
	local opts = { capabilities = default_caps }

	if ft_map[name] then
		opts.filetypes = ft_map[name]
	end

	local custom = server_configs[name]
	if custom then
		for k, v in pairs(custom) do opts[k] = v end
	end

	if not opts.cmd then
		opts.cmd = { get_binary_name(name) }
	end

	return opts
end

local function register_autocmd(opts)
	if opts.filetypes then
		Nvim.api.nvim_create_autocmd("FileType", {
			pattern = opts.filetypes,
			callback = function(ev)
				Nvim.lsp.start(opts, { bufnr = ev.buf })
			end,
		})
	end
end

-- }}}

-- ============================================================================
--  LSP Install
-- ============================================================================
-- {{{

local function install_servers()
	local registry = require("mason-registry")
	print("LSP Install Start...")

	for _, name in ipairs(servers) do
		if is_system_available(name) then
			print("System Found: " .. name)
		else
			local pkg_name = get_mason_name(name)
			local ok, pkg = pcall(registry.get_package, pkg_name)

			if ok and pkg and not pkg:is_installed() then
				print("Mason Installing: " .. pkg_name)
				pkg:install():once("closed", function()
					print("Mason Done: " .. pkg_name)
				end)
			end
		end
	end
end

Nvim.api.nvim_create_user_command('LSPInstall', install_servers,
	{ nargs = 0, desc = 'LSP Install' }
)

-- }}}

-- ============================================================================
--  LSP Setup
-- ============================================================================
-- {{{

local function setup_servers()
	pcall(require("mason").setup)

	for _, name in ipairs(servers) do
		pcall(function()
			if resolve_server_availability(name) then
				local opts = build_opts(name)
				register_autocmd(opts)
			end
		end)
	end
end

setup_servers()

Nvim.api.nvim_create_user_command('LSPLoad', setup_servers,
	{ nargs = 0, desc = 'LSP Load and Reload' }
)

-- }}}

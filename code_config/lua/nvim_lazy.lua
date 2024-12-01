-- ################################
-- # Nvim-Lua Lazy-Plugins
-- ################################


Nvim.lazy.setup()

local lazy = require("lazy")
lazy.setup({
	spec = {
		{
			"rebelot/kanagawa.nvim",
			config = function()
				Nvim.cmd.colorscheme("kanagawa-wave")
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			opts = {
				ensure_installed = {
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
				},
				highlight = {
					enable = true
				},
				indent = {
					enable = true
				},
				matchup = {
					enable = true
				},
				sync_install = false,
			},
			config = function(_, opts)
				local treesitter = require('nvim-treesitter.configs')
				treesitter.setup(opts)
			end,
		},
		{
			"nvim-neorg/neorg",
			lazy = false,
			version = "*",
			opts = {
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.export"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								workspace = "~/Workspace",
							},
							default_workspace = "workspace",
						},
					},
				},
			},
			config = function(_, opts)
				local neorg = require("neorg")
				neorg.setup(opts)

				Nvim.winoption.foldlevel = 99
				Nvim.winoption.conceallevel = 2
			end,
		},
		{
			"nvim-tree/nvim-tree.lua",
			version = "*",
			lazy = false,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			opts = {
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
					indent_markers = {
						enable = true,
						icons = {
							corner = "└ ",
							edge = "│ ",
							item = "│ ",
							none = "  ",
						},
					},
				},
				filters = {
					dotfiles = false,
				},
			},
			config = function(_, opts)
				local nvimtree = require('nvim-tree')
				nvimtree.setup(opts)
			end,
		},
		{
			'stevearc/oil.nvim',
			opts = {},
			dependencies = { { "echasnovski/mini.icons", opts = {} } },
		},
		{
			'nvim-orgmode/orgmode',
			event = 'VeryLazy',
			ft = { 'org' },
			config = function()
				local orgmode = require('orgmode')
				orgmode.setup()
			end,
		},
	},
	install = {
		colorscheme = { "kanagawa-wave" }
	},
	checker = {
		enabled = true
	},
})

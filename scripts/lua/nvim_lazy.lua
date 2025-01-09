-- ################################
-- # Nvim-Lua Lazy-Plugins
-- ################################


Nvim.lazy.setup()

local lazy = require("lazy")
lazy.setup({
	spec = {
		{
			"rebelot/kanagawa.nvim",
			version = false,
			config = function()
				Nvim.cmd.colorscheme("kanagawa-wave")
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			lazy = false,
			version = false,
			opts = {
				highlight = {
					enable = true
				},
				indent = {
					enable = true
				},
				matchup = {
					enable = true
				},
				auto_install = true,
				sync_install = false,
			},
			config = function(_, opts)
				local treesitter = require("nvim-treesitter.configs")
				treesitter.setup(opts)
			end,
		},
		{
			"nvim-neorg/neorg",
			lazy = false,
			version = false,
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
			"NeogitOrg/neogit",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"sindrets/diffview.nvim",
				"nvim-telescope/telescope.nvim",
				"ibhagwan/fzf-lua",
				"echasnovski/mini.pick",
			},
			version = false,
			config = true
		},
		{
			"nvim-tree/nvim-tree.lua",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			lazy = false,
			version = false,
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
				local nvimtree = require("nvim-tree")
				nvimtree.setup(opts)
			end,
		},
		{
			"brenton-leighton/multiple-cursors.nvim",
			version = false,
			opts = {}, -- This causes the plugin setup function to be called
			keys = {
				{ "<C-j>",         "<Cmd>MultipleCursorsAddDown<CR>",          mode = { "n", "x" },      desc = "Add cursor and move down" },
				{ "<C-k>",         "<Cmd>MultipleCursorsAddUp<CR>",            mode = { "n", "x" },      desc = "Add cursor and move up" },

				{ "<C-Up>",        "<Cmd>MultipleCursorsAddUp<CR>",            mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
				{ "<C-Down>",      "<Cmd>MultipleCursorsAddDown<CR>",          mode = { "n", "i", "x" }, desc = "Add cursor and move down" },

				{ "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>",   mode = { "n", "i" },      desc = "Add or remove cursor" },

				{ "<Leader>a",     "<Cmd>MultipleCursorsAddMatches<CR>",       mode = { "n", "x" },      desc = "Add cursors to cword" },
				{ "<Leader>A",     "<Cmd>MultipleCursorsAddMatchesV<CR>",      mode = { "n", "x" },      desc = "Add cursors to cword in previous area" },

				{ "<Leader>d",     "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" },      desc = "Add cursor and jump to next cword" },
				{ "<Leader>D",     "<Cmd>MultipleCursorsJumpNextMatch<CR>",    mode = { "n", "x" },      desc = "Jump to next cword" },

				{ "<Leader>l",     "<Cmd>MultipleCursorsLock<CR>",             mode = { "n", "x" },      desc = "Lock virtual cursors" },
			},
		},
		{
			"smoka7/multicursors.nvim",
			dependencies = {
				"nvimtools/hydra.nvim",
			},
			version = false,
			event = "VeryLazy",
			opts = {},
			cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
			keys = {
				{
					mode = { "v", "n" },
					"<Leader>m",
					"<cmd>MCstart<cr>",
					desc = "Create a selection for selected text or word under the cursor",
				},
			},
		},
		{
			"stevearc/oil.nvim",
			dependencies = {
				{ "echasnovski/mini.icons", opts = {} },
			},
			lazy = false,
			opts = {},
		},
		{
			"nvim-orgmode/orgmode",
			lazy = false,
			event = "VeryLazy",
			ft = { "org" },
			config = function()
				local orgmode = require("orgmode")
				orgmode.setup()
			end,
		},
		{
			"sheerun/vim-polyglot",
			version = false,
		},
		{
			"ARM9/arm-syntax-vim",
			version = false,
		},
		{
			"kylelaker/riscv.vim",
			version = false,
		},
	},
	install = {
		colorscheme = { "kanagawa-wave" }
	},
	checker = {
		enabled = true
	},
})

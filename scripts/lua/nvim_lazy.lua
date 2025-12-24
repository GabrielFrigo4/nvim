-- ============================================================================
--  Nvim-Lua Lazy-Plugins
-- ============================================================================
-- {{{

Nvim.lazy.setup()
local lazy = require("lazy")

lazy.setup({
    spec = {
        -- ============================================================================
        --  1. TEMA & VISUAL
        -- ============================================================================
        -- {{{
        {
            "rebelot/kanagawa.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                Nvim.cmd.colorscheme("kanagawa-wave")
            end,
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            config = function()
                require('lualine').setup({
                    options = { theme = 'kanagawa' }
                })
            end
        },
        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = {},
        },
        -- }}}

        -- ============================================================================
        --  2. SINTAXE & HIGHLIGHT
        -- ============================================================================
        -- {{{
        {
            "nvim-treesitter/nvim-treesitter",
            lazy = false,
            version = false,
            build = ":TSUpdate",
            opts = {
                highlight    = { enable = true },
                indent       = { enable = true },
                matchup      = { enable = true },
                auto_install = true,
                sync_install = false,
            },
            config = function(_, opts)
                require("nvim-treesitter.configs").setup(opts)
            end,
        },
        {
            "sheerun/vim-polyglot",
            lazy = false,
            config = function()
                Nvim.global.polyglot_disabled = { 'ftdetect' }
            end,
        },
        -- }}}

        -- ============================================================================
        --  3. GERENCIAMENTO DE ARQUIVOS
        -- ============================================================================
        -- {{{
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            lazy = false,
            opts = {
                sort = { sorter = "case_sensitive" },
                view = { width = 30 },
                renderer = {
                    group_empty = true,
                    indent_markers = { enable = true },
                },
                filters = { dotfiles = false },
            },
            config = function(_, opts)
                require("nvim-tree").setup(opts)
            end,
        },
        {
            "stevearc/oil.nvim",
            dependencies = { "echasnovski/mini.icons" },
            lazy = false,
            opts = {},
        },
        -- }}}

        -- ============================================================================
        --  4. FERRAMENTAS & EDIÇÃO
        -- ============================================================================
        -- {{{
        {
            'nvim-telescope/telescope.nvim',
            dependencies = { 'nvim-lua/plenary.nvim' },
            lazy = false,
            config = function()
                require('telescope').setup()
            end,
        },
        {
            "kylechui/nvim-surround",
            version = "*",
            event = "VeryLazy",
            config = function()
                require("nvim-surround").setup({})
            end
        },
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true
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
            config = true
        },
        {
            "smoka7/multicursors.nvim",
            dependencies = { "nvimtools/hydra.nvim" },
            event = "VeryLazy",
            opts = {},
            cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern" },
            keys = {
                { mode = { "v", "n" }, "<Leader>m", "<cmd>MCstart<cr>", desc = "Multi Cursor" },
            },
        },
        -- }}}

        -- ============================================================================
        --  5. LSP & AUTOCOMPLETE
        -- ============================================================================
        -- {{{
        {
            "neovim/nvim-lspconfig",
            dependencies = {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "hrsh7th/cmp-nvim-lsp",
            },
            config = function()
                require("mason").setup()
                local capabilities = require('cmp_nvim_lsp').default_capabilities()

                require("mason-lspconfig").setup({
                    ensure_installed = {
                        -- Languages (ASM)
                        "asm_lsp", -- Assembly

                        -- Languages (BIN)
                        "zls",           -- Zig
                        "rust_analyzer", -- Rust
                        "gopls",         -- Go

                        -- Languages (JIT)
                        "jdtls", -- Java

                        -- Languages (VM)
                        "pyright", -- Python
                        "lua_ls",  -- Lua

                        -- Languages (WEB)
                        "ts_ls", -- Javascript, Typescript
                        "html",  -- HTML
                        "cssls", -- CSS

                        -- Make
                        "neocmake", -- CMake

                        -- Data
                        "yamlls",  -- YAML
                        "lemminx", -- XML
                        "jsonls",  -- JSON

                        -- Other
                        "bashls", -- Bash
                    },
                    handlers = {
                        function(server_name)
                            require("lspconfig")[server_name].setup({
                                capabilities = capabilities
                            })
                        end,
                    }
                })
            end
        },
        {
            'hrsh7th/nvim-cmp',
            dependencies = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'L3MON4D3/LuaSnip',
                'saadparwaiz1/cmp_luasnip',
            },
            config = function()
                local cmp = require 'cmp'
                local luasnip = require 'luasnip'

                cmp.setup({
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body)
                        end,
                    },
                    mapping = cmp.mapping.preset.insert({
                        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-f>'] = cmp.mapping.scroll_docs(4),
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<C-e>'] = cmp.mapping.abort(),
                        ['<CR>'] = cmp.mapping.confirm({ select = true }),
                        ['<Tab>'] = cmp.mapping.select_next_item(),
                    }),
                    sources = cmp.config.sources({
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' },
                    }, {
                        { name = 'buffer' },
                    })
                })
            end
        },
        -- }}}

        -- ============================================================================
        --  6. LINGUAGENS ESPECÍFICAS
        -- ============================================================================
        -- {{{
        { "GabrielFrigo4/fasm.vim", ft = "fasm" },
        { "kylelaker/riscv.vim",    ft = "riscv" },
        { "ARM9/arm-syntax-vim",    ft = "arm" },
        { "thindil/vim-ada",        ft = "ada" },
        -- }}}
    },

    -- ============================================================================
    --  7. CONFIGURAÇÃO GERAL
    -- ============================================================================
    -- {{{
    install = { colorscheme = { "kanagawa-wave" } },
    checker = { enabled = true },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin",
            },
        },
    },
    -- }}}
})

-- }}}

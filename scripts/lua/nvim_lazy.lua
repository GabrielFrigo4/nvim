-- ============================================================================
--  Nvim-Lua Lazy-Plugins
-- ============================================================================
-- {{{

Nvim.lazy.setup()
local lazy = require("lazy")

lazy.setup({
    spec = {
        -- ============================================================================
        --  1. TEMA
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
        -- }}}

        -- ============================================================================
        --  2. SINTAXE E HIGHLIGHT
        -- ============================================================================
        -- {{{
        {
            "nvim-treesitter/nvim-treesitter",
            lazy = false,
            version = false,
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
                    indent_markers = {
                        enable = true,
                        icons = {
                            corner = "└ ",
                            edge   = "│ ",
                            item   = "│ ",
                            none   = "  ",
                        },
                    },
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
        --  4. FERRAMENTAS
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
                {
                    mode = { "v", "n" },
                    "<Leader>m",
                    "<cmd>MCstart<cr>",
                    desc = "Multi Cursor",
                },
            },
        },
        -- }}}

        -- ============================================================================
        --  5. LINGUAGENS ESPECÍFICAS
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

-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- List the plugins to install
local plugins = { 
    -- Color themes
    { 
        'ellisonleao/gruvbox.nvim', 
        name='gruvbox', 
        priority = 1000
    },
    { 
        'blazkowolf/gruber-darker.nvim',
        name='gruber', 
        priority = 1000
    },
    { 
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000 
    },
    {
        'embark-theme/vim', 
        name = 'embark', 
        priority = 1000
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000
    },
    {
        "rebelot/kanagawa.nvim",
        name = 'kanagawa',
        priority = 1000
    },
    { 
        'rose-pine/neovim', 
        name = 'rose-pine',
        priority = 1000
    },
    { 
        'whatyouhide/vim-gotham', 
        name = 'gotham',
        priority = 1000
    },
    { 
        'AlexvZyl/nordic.nvim', 
        name = 'nordic',
        priority = 1000
    },
    { 
        'shaunsingh/nord.nvim', 
        name = 'nord',
        priority = 1000
    },
    { 
        'fenetikm/falcon', 
        name = 'falcon',
        priority = 1000
    },
    { 
        'challenger-deep-theme/vim', 
        name = 'challenger-deep',
        priority = 1000
    },

    -- Monochromatic Color Themes
    { 
        'aditya-azad/candle-grey', 
        name = 'candle-grey',
        priority = 1000
    },
    { 
        'ntk148v/komau.vim', 
        name = 'komau',
        priority = 1000
    },


    -- Hoping around with a fuzzy finder
    { 
        'nvim-telescope/telescope.nvim',
        dependencies = { 
            'nvim-lua/plenary.nvim' 
        } 
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim', build = 'make' 
    },

    -- Comment easily
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },

    -- Close parenthesis and brackets automatically
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    -- Better syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

    -- LSP, Mason and Snippets
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }, 

    -- Amazing git plugin
    {
        'tpope/vim-fugitive',
    },

    -- Directory tree to avoid disgusting netrw
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },

    -- Easy surrounding motions to add or remove parenthesis, etc
    {
        "kylechui/nvim-surround",
        version = "*", 
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({ })
        end
    },
    -- Set lualine as statusline
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = true,
                theme = 'horizon',
                component_separators = '|',
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    { 'mode', separator = { left = '' }, right_padding = 2 },
                },
                lualine_b = { 'filename', 'branch', 'diff'},
                lualine_c = {},
                lualine_x = {},
                lualine_y = { 'filetype', 'progress' },
                lualine_z = {
                    { 'location', separator = { right = '' }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            tabline = {},
            extensions = {},
        },
    },

    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },

    -- Add indentation guides even on blank lines
    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            char = '┊',
            show_trailing_blankline_indent = false,
        },
    },

}


require("lazy").setup(plugins)

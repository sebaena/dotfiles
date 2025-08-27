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
    {
       'EdenEast/nightfox.nvim',
        name = 'nightfox',
        priority = 1000
    },

    -- Hoping around with a fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('plugins.telescope')
        end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
    },

    -- Comment easily
    {
        'numToStr/Comment.nvim',
        lazy = false,
        opts = {
            toggler = {
                line = "<leader>'"
            },
            opleader = {
                line = "<leader>'"
            },
        }
    },

    -- Close parenthesis and brackets automatically
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },

    -- Better syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('plugins.treesitter')
        end,
    },

    -- Lspconfig
    {
       'neovim/nvim-lspconfig',
    },

    -- Mason
     {
     "mason-org/mason.nvim",
         opts = {}
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
            require("plugins.tree")
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
        config = function()
            require("plugins.lualine")
        end,
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
        main = "ibl",
        opts = {
           indent = {char = '▏', highlight = { "NonText" } },
        scope = {show_start = false, show_end = false}
        },
    },
    {
        "L3MON4D3/LuaSnip",
        keys = {}
    },
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        version = "*",
        config = function()
            require("blink.cmp").setup({
                snippets = { preset = "luasnip" },
                signature = { enabled = true },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "normal",
                },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                    providers = {
                        cmdline = {
                            min_keyword_length = 2,
                        },
                    },
                },
                completion = {
                    menu = {
                        border = nil,
                        scrolloff = 1,
                        scrollbar = false,
                        draw = {
                            columns = {
                                { "kind_icon" },
                                { "label", "label_description", gap = 1 },
                                { "kind" },
                                { "source_name" },
                            },
                        },
                    },
                    documentation = {
                        window = {
                            border = 'single',
                        },
                        auto_show = true,
                    },
                },
            })
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}

require("lazy").setup(plugins)

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
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000 

    },

    {
        'embark-theme/vim', 
        name = 'embark', 
        priority = 1000
    },

    -- Hoping around with a fuzzy finder
    { 
        'nvim-telescope/telescope.nvim',
        dependencies = { 
            'nvim-lua/plenary.nvim' 
        } 
    },

    -- Comment easily
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },

    -- Better syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

    -- LSP, Mason and Snippets
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'folke/neodev.nvim', 
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            'hrsh7th/cmp-nvim-lsp',
        },
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
        theme = 'catppuccin',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

{
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
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
'tpope/vim-fugitive',

    -- Add indentation guides even on blank lines
{
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },



}


requirei"lazy").setup(plugins)

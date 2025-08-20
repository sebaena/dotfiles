-- use horizon as base theme. It comes by default with lualine
local custom_theme = require'lualine.themes.horizon'

-- For modified pandora terminal theme (and neon tmux)
custom_theme.normal.a.bg = '#5ae8c2'
custom_theme.insert.a.bg = '#00e851'
custom_theme.visual.a.bg = '#d4a600'


require('lualine').setup{

    options = {
        icons_enabled = true,
        theme = custom_theme,
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



}

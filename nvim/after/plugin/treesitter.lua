require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'vim',
		'javascript',
		'typescript',
		'css',
		'html',
		'json',
		'lua',
		'cpp',
		'c',
		'python',
		'matlab',
		'bash',
		'go',
		'groovy',
		'dockerfile',
		'vimdoc',
	},

    auto_install = false,
		sync_install = false,

		highlight = {
			enable = true ,
			additional_vim_regex_highlighting = false,
		},
    indent = { enable = true },
}

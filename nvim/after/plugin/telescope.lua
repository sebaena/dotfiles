local builtin = require('telescope.builtin')
-- find project files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- grep inside git repository files only. (i.e ignores node modules)
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
-- greps project everywehre
vim.keymap.set('n', '<leader>pr', builtin.live_grep, {})



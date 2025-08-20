-- Set mapleader
vim.g.mapleader = ' '

-- Save and exit
vim.keymap.set('n', '<leader>w',':w<CR>')
vim.keymap.set('n', '<leader>q',':q<CR>')

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>',{silent=true})
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>',{silent=true})
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>',{silent=true})
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>',{silent=true})

-- Remove highlight after searching a word
vim.keymap.set('n', '<leader>no', ':nohlsearch<CR>',{silent=true})

-- Access buffers easily
vim.keymap.set('n', '<leader>b', ':ls<CR>:b<Space>',{silent=true})

-- Resize panes with arro keys
vim.keymap.set('n', '<S-Left>', ':vertical resize -1<CR>',{silent=true})
vim.keymap.set('n', '<S-Right>', ':vertical resize +1<CR>',{silent=true})
vim.keymap.set('n', '<S-Up>', ':resize +1<CR>',{silent=true})
vim.keymap.set('n', '<S-Down>', ':resize -1<CR>',{silent=true})

-- Better copy pasting
vim.keymap.set("x", "<leader>p", [["_dP]])



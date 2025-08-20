
require('mini.completion').setup({
  completion = {
    autocomplete = true,
    debounce = 200,
  },
})


-- Mini.surround setup
-- require('mini.surround').setup({
--   mappings = {
--     add = 'sa',
--     delete = 'sd',
--     replace = 'sr',
--     find = 'sf',
--     find_left = 'sF',
--     update_n_lines = 'sn',
--   },
-- })

require('mini.comment').setup({
  mappings = {
    comment = 'gc',
    comment_line = 'gcc',
  },
})

require('mini.snippets').setup({
  mappings = {
    expand = '<C-k>',
    jump_forward = '<C-l>',
    jump_backward = '<C-h>',
  },
  -- Directory for custom snippets
  -- snippets_dir = '~/.config/nvim/snippets',
})

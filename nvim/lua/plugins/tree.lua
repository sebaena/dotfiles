vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<leader>nt', ':NvimTreeFindFileToggle<CR>')
    vim.keymap.set('n', '<C-s>', 'api_node.node.open.vertical', opts('Veritcal'))
  end
  -- pass to setup along with your other options
  require("nvim-tree").setup {
    on_attach = my_on_attach,
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    view = {
      width = 32,
    },
  }

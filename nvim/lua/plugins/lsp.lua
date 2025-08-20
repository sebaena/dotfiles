
local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

-- Setup mason-lspconfig to ensure the servers are installed
mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",    -- Lua Language Server
    "gopls",     -- Go Language Server
    "pyright",   -- Python Language Server
    "ts_ls",     -- TypeScript/JavaScript/React Language Server (typescript-language-server)
    "cssls",     -- CSS Language Server
    "html",      -- HTML Language Server
  },
  automatic_installation = true,  -- Automatically install missing servers on startup
})

-- Python language server setup (pyright)
-- lspconfig.pyright.setup({
-- cmd = { "pyright-langserver", "--stdio" },
--   filetypes = { 'python' },
--   root_markers = {
--     'pyproject.toml',
--     'setup.py',
--     'setup.cfg',
--     'requirements.txt',
--     'Pipfile',
--     'pyrightconfig.json',
--     '.git',
--   },
--   settings = {
--     python = {
--       analysis = {
--         autoSearchPaths = true,
--         diagnosticMode = "openFilesOnly",  -- Only diagnostics on open files (for performance)
--         useLibraryCodeForTypes = true,  -- Enable type checking on libraries
--       },
--     },
--   },
-- })


-- Lua language server setup (lua-language-server)
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},  -- Add 'vim' to globals
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),  -- Include Neovim's runtime files
      },
    },
  },
})

-- Go language server setup (gopls)
lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        unreachable = true,
      },
      staticcheck = true,
    },
  },
})


lspconfig.cssls.setup({
  settings = {
    css = {
      validate = true,
    },
    scss = {
      validate = true,
    },
    less = {
      validate = true,
    },
  },
})

-- HTML language server setup (html)
lspconfig.html.setup({
  settings = {
    html = {
      suggest = {
        html5 = true,  -- Enable HTML5 elements
        angular = true, -- Optional: Enable Angular-related HTML features
      },
    },
  },
})

-- TypeScript/JavaScript/React language server setup (typescript-language-server, ts_ls)
lspconfig.ts_ls.setup({
  settings = {
    javascript = {
      format = {
        semicolons = "ignore",  -- Remove semicolons when formatting JS
      },
    },
    typescript = {
      format = {
        semicolons = "ignore",  -- Remove semicolons when formatting TS
      },
    },
    react = {
      format = {
        semicolons = "ignore",  -- React's JSX can work without semicolons
      },
    },
  },
})









-- local lsp = require("lsp-zero")

-- lsp.preset("recommended")

-- lsp.ensure_installed({
--   -- 'tsserver',
--   -- 'rust_analyzer',
-- })

-- -- Fix Undefined global 'vim'
-- lsp.nvim_workspace()


-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--   ["<C-Space>"] = cmp.mapping.complete(),
-- })

-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings
-- })

-- lsp.set_preferences({
--     suggest_lsp_servers = false,
--     sign_icons = {
--         error = 'E',
--         warn = 'W',
--         hint = 'H',
--         info = 'I'
--     }
-- })

-- lsp.on_attach(function(client, bufnr)
--   local opts = {buffer = bufnr, remap = false}

--   -- vim.keymnp.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--   -- vim.keymnp.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
--   -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--   -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--   -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--   -- vim.keymap.set("n", "<leaeer>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--   -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

-- end)

-- require('lspconfig').clangd.setup { }
-- require 'lspconfig'.pyright.setup {}

-- lsp.setup()


-- vim.diagnostic.config({
--     virtual_text = true
-- })


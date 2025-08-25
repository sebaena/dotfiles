-- -- Create lsp keymaps
-- -- local on_attach = function(client, bufnr)
-- --   local bufopts = { noremap=true, silent=true, buffer=bufnr }
-- --
-- --   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
-- --   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
-- --   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
-- --   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
-- --   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
-- --   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
-- --   vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
-- --   vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
-- --   vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
-- -- end

-- local lspconfig = require("lspconfig")
-- local mason_lspconfig = require("mason-lspconfig")
-- local mason = require("mason")

-- -- Your on_attach with keymaps
-- local on_attach = function(_, bufnr)
--   local opts = { buffer = bufnr, noremap = true, silent = true }
--   local map = vim.keymap.set

--   map("n", "gd", vim.lsp.buf.definition, opts)
--   map("n", "gD", vim.lsp.buf.declaration, opts)
--   map("n", "gi", vim.lsp.buf.implementation, opts)
--   map("n", "gr", vim.lsp.buf.references, opts)
--   map("n", "K", vim.lsp.buf.hover, opts)
--   map("n", "<leader>rn", vim.lsp.buf.rename, opts)
--   map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
--   map("n", "[d", vim.diagnostic.goto_prev, opts)
--   map("n", "]d", vim.diagnostic.goto_next, opts)
-- end

-- -- Configure lsp servers that use more than the default options
-- vim.lsp.config('lua_ls', {
-- 	settings = {
-- 		Lua = {
-- 			diagnostics = {
-- 				globals = {
-- 					'vim',
-- 					'require'
-- 				},
-- 			},
-- 		},
-- 	},
-- })

--   mason.setup()
--   mason_lspconfig.setup({ -- REQUIRED before setup_handlers
--     ensure_installed = { "lua_ls", "basedpyright" },
--   })


-- mason_lspconfig.setup_handlers({
--   function(server_name)
--     lspconfig[server_name].setup({
--       on_attach = on_attach,
--     })
--   end,

--   -- ["lua_ls"] = function()
--   --   lspconfig.lua_ls.setup({
--   --     on_attach = on_attach,
--   --     settings = {
--   --       Lua = {
--   --         diagnostics = {
--   --           globals = { "vim" },
--   --         },
--   --       },
--   --     },
--   --   })
--   -- end,
-- })



-- vim.diagnostic.config({
--     -- virtual_lines = true,
--     virtual_lines = {current_line = true},
--     -- virtual_text = true,
--     underline = false,
--     update_in_insert = false,
--     severity_sort = true,
--     float = {
--         border = "rounded",
--         source = true,
--     },
--     signs = {
--         text = {
--             [vim.diagnostic.severity.ERROR] = "󰅚 ",
--             [vim.diagnostic.severity.WARN] = "󰀪 ",
--             [vim.diagnostic.severity.INFO] = "󰋽 ",
--             [vim.diagnostic.severity.HINT] = "󰌶 ",
--         },
--         numhl = {
--             [vim.diagnostic.severity.ERROR] = "ErrorMsg",
--             [vim.diagnostic.severity.WARN] = "WarningMsg",
--         },
--     },
-- })

local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()

mason_lspconfig.setup({
  ensure_installed = { "lua_ls", "pylsp" },
  automatic_installation = true,

  -- ["lua_ls"] = function()
  --   lspconfig.lua_ls.setup({
  --     on_attach = on_attach,
  --     settings = {
  --       Lua = {
  --         diagnostics = {
  --           globals = { "vim" },
  --         },
  --       },
  --     },
  --   })
  -- end,

})

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }
  local map = vim.keymap.set

  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "gr", vim.lsp.buf.references, opts)
  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "<leader>rn", vim.lsp.buf.rename, opts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  map("n", "[d", vim.diagnostic.goto_prev, opts)
  map("n", "]d", vim.diagnostic.goto_next, opts)
end


-- Setup other installed servers automatically:
for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
  if server ~= "lua_ls" then  -- already configured above
    lspconfig[server].setup({
      on_attach = on_attach,
    })
  end
end

-- -- -- Setup lua_ls with special settings first:.
-- lspconfig.lua_ls.setup({
--   on_attach = on_attach,
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { 'vim', 'require' },
--       },
--     },
--   },
-- })

-- Diagnostic config (optional)
vim.diagnostic.config({
  virtual_lines = { current_line = true },
  underline = false,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

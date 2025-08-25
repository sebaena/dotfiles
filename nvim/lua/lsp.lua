local lspconfig = require("lspconfig")
local mason = require("mason")
-- local mason_lspconfig = require("mason-lspconfig")

mason.setup()

-- mason_lspconfig.setup({
--   ensure_installed = { "lua_ls", "pylsp" },
--   automatic_installation = true,
-- })

-- Set keymaps for lsp navigation
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

-- -- Configure lsp servers that use more than the default options
vim.lsp.config('lua_ls', {
  on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					'vim',
					'require'
				},
			},
		},
	},
})

vim.lsp.config('pylsp', {
  on_attach = on_attach,
})

vim.lsp.config('ts_ls', {
  on_attach = on_attach,
})

vim.lsp.enable({'pylsp', 'lua_ls', 'ts_ls'})

-- Setup other installed servers automatically:
-- for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
--   if server ~= "lua_ls" then  -- already configured above
--     lspconfig[server].setup({
--       on_attach = on_attach,
--     })
--   end
-- end

-- Diagnostic config
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

-- Lsp configuration. This is all that is needed to have a working lsp

-- The steps to add a new language are:
-- 1. find the name of the server in mason and lspconfig
-- 2. add them in the servers list, ["mason name"] = {name = "lspconfig name"}
-- 3. install the language in mason (or exit and open nvim after including it in the servers list) so that
-- its automatically installed


local servers = {
  ["lua-language-server"] = {
    name = "lua_ls",
    config = {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    },
  },
  ["python-lsp-server"] = { name = "pylsp" },
  ["typescript-language-server"] = { name = "ts_ls" },
  ["html-lsp"] = { name = "html" },
  ["css-lsp"] = { name = "cssls" },
}

-- set keybindings for lsp navigation
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



local mason_registry = require("mason-registry")

for mason_name, opts in pairs(servers) do
    -- Install servers in the servers list automatically if they are not installed
    if not mason_registry.is_installed(mason_name) then
        mason_registry.get_package(mason_name):install()
    end

    -- Pass configuration to lsp server
    vim.lsp.config(opts.name, vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    }, opts.config or {}))

    -- Enable lsp server
    vim.lsp.enable(opts.name)
end



-- Diagnostic settings
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

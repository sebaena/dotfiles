-- Lsp configuration. This is all that is needed to have a working lsp
-- Add new languages to the "servers" list to enable. Look up the names in Mason
-- and lspconfig to know how to set the look-up table

-- list all the lsp servers. Mason and lsp have different names
-- for the same server, so this is liek a look-up table.
-- Write new lsp servers here
local servers = {
  ["lua-language-server"] = {
    name = "lua_ls",
    settings = {
            Lua = {
                diagnostics = {
                    globals = {
                        "vim"
                    }
                }
            }
        },
  },
  ["python-lsp-server"] = {
        name = "pylsp"
    },
  ["typescript-language-server"] = {
        name = "ts_ls"
    },
  ["html-lsp"] = {
        name = "html"
    },
  ["css-lsp"] = {
        name = "cssls"
    },
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


-- create local variables for easy readibility
local mason_registry = require("mason-registry")
local lspconfig = require("lspconfig")

-- Install servers in the servers list automatically if they are
-- not installed. Then enable all servers and pass configuration
-- to get lsp working automatically
for mason_name, opts in pairs(servers) do
    if not mason_registry.is_installed(mason_name) then
        mason_registry.get_package(mason_name):install()
    end

    local lsp_opts = vim.tbl_deep_extend("force", { on_attach = on_attach }, opts or {})
    lspconfig[lsp_opts.name].setup(lsp_opts)
    vim.lsp.enable(lsp_opts.name)
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

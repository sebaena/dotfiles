lspconfig.pyright.setup({
cmd = { "pyright-langserver", "--stdio" },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",  -- Only diagnostics on open files (for performance)
        useLibraryCodeForTypes = true,  -- Enable type checking on libraries
      },
    },
  },
})

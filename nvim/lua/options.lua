vim.o.belloff = 'all'
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.opt.softtabstop = 4
vim.o.updatetime = 50
vim.o.termguicolors = true
vim.o.mouse = 'a'
vim.opt.nu = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.scrolloff = 8
vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn = '120'

-- remove trailing white spaces on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})


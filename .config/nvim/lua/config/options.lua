vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.diagnostic.config({
    virtual_lines = false,
})

vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.o.background = "dark"

vim.o.nu = true
vim.o.relativenumber = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.wrap = false
vim.o.completeopt = "menuone,noselect"

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<CR>", {})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})

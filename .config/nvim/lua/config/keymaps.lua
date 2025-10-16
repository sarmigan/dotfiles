vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})

-- Normal mode: current line
vim.keymap.set("n", "<leader>rn", function()
  require("custom.review").add_note()
end, { desc = "Review: add note for current line" })

-- Visual mode: use the selected range via :lua call with line1/line2
vim.keymap.set("x", "<leader>rn", function()
  -- Exit visual mode so the marks `< and `> are set
  local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
  vim.api.nvim_feedkeys(esc, "x", false)
  -- After feedkeys with mode "x", marks are now updated
  local s = vim.fn.getpos("'<")[2]
  local e = vim.fn.getpos("'>")[2]
  require("custom.review").add_note(s, e)
end, { desc = "Review: add note for selection" })

vim.keymap.set("n", "<leader>ry", function() require("custom.review").copy() end,
  { desc = "Copy review to clipboard" })
vim.keymap.set("n", "<leader>rc", function() require("custom.review").clear() end,
  { desc = "Clear review buffer" })

vim.keymap.set("n", "<leader>dv", function()
  local lib = require("diffview.lib")
  if lib.get_current_view() then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewOpen")
  end
end, { desc = "Diffview: toggle" })

return {
  {
    "sindrets/diffview.nvim",
    config = function()
      local actions = require("diffview.actions")

      require("diffview").setup({
        keymaps = {
          file_panel = {
            { "n", "<leader>o", function()
              actions.select_entry()
              actions.focus_entry() -- focus the diff (lands on old by default)
              vim.cmd("wincmd l")   -- one move right → new pane
            end, { desc = "Open entry and focus new pane" } },
          },
        },
      })
    end,
  },
}

return {
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { lsp_format = "fallback" },
          python = { "ruff" },
          typescript = { "prettierd" },
        },
      })
    end
  }
}

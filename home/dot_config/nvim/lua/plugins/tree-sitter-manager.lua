return {
  {
    "romus204/tree-sitter-manager.nvim",
    dependencies = {},
    config = function()
      require("tree-sitter-manager").setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
          "python",
          "css",
          "html",
          "javascript",
          "json",
          "tsx",
          "typescript",
          "terraform"
        },
        auto_install = true,
      })
    end

  },
}

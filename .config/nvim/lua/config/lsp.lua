vim.lsp.enable("pyright")
vim.lsp.enable("lua_ls")

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            }
        }
    }
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local bufnr = ev.buf

        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    end,
})

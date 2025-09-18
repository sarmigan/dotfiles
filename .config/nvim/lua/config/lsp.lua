local mason_registry = require("mason-registry")

mason_registry.update(function()
    if not mason_registry.is_installed("pyright") then
        mason_registry.get_package("pyright"):install()
    end

    if not mason_registry.is_installed("lua-language-server") then
        mason_registry.get_package("lua-language-server"):install()
    end
end)

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

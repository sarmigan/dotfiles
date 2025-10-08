local mason_registry = require("mason-registry")

mason_registry.update(function()
    if not mason_registry.is_installed("clangd") then
        mason_registry.get_package("clangd"):install()
    end

    if not mason_registry.is_installed("lua-language-server") then
        mason_registry.get_package("lua-language-server"):install()
    end

    if not mason_registry.is_installed("vim-language-server") then
        mason_registry.get_package("vim-language-server"):install()
    end

    if not mason_registry.is_installed("marksman") then
        mason_registry.get_package("marksman"):install()
    end

    if not mason_registry.is_installed("pyright") then
        mason_registry.get_package("pyright"):install()
    end

    if not mason_registry.is_installed("css-lsp") then
        mason_registry.get_package("css-lsp"):install()
    end

    if not mason_registry.is_installed("html-lsp") then
        mason_registry.get_package("html-lsp"):install()
    end

    if not mason_registry.is_installed("vtsls") then
        mason_registry.get_package("vtsls"):install()
    end

    if not mason_registry.is_installed("json-lsp") then
        mason_registry.get_package("json-lsp"):install()
    end
end)

vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("vimls")
vim.lsp.enable("marksman")
vim.lsp.enable("pyright")
vim.lsp.enable("cssls")
vim.lsp.enable("html")
vim.lsp.enable("vtsls")
vim.lsp.enable("jsonls")

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

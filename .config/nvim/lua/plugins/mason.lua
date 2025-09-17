return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()

            local mason_registry = require("mason-registry")

            if not mason_registry.is_installed("pyright") then
                mason_registry.get_package("pyright"):install()
            end

            if not mason_registry.is_installed("lua-language-server") then
                mason_registry.get_package("lua-language-server"):install()
            end
        end,
    },
}

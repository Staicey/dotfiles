return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" },
        opts = {
            diagnostics = {
                virtual_text = false,
            },
        },
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },

        config = function()
            local mason_tool_installer = require("mason-tool-installer")

            require("mason").setup()
            mason_tool_installer.setup({
                ensure_installed = {
                    -- formatters --
                    "stylua",
                    "shfmt",

                    -- linters --
                    "shellcheck",

                    -- lsp --
                    "bash-language-server",
                    "gopls",
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            ---@type MasonLspconfigSettings
            return {
                ensure_installed = { "gopls", "bashls", "lua_ls" },
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({ capabilities = capabilities })
                    end,
                },
            }
        end,
    },
}

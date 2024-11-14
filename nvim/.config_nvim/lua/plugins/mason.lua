return {
    {
        "neovim/nvim-lspconfig",
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
                    "cfn-lint", -- cloudformation aws

                    -- lsp --
                    "bash-language-server",
                    "gopls",
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "gopls", "bashls", "lua_ls" },
            })
            require("mason-lspconfig").setup_handlers({
                function(server)
                    require("lspconfig")[server].setup({})
                end,
            })
        end,
    },
}

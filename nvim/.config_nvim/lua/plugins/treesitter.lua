return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            require("nvim-treesitter.install").prefer_git = true

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "bash" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
                modules = {},
                ignore_install = {},
                auto_install = true,
            })
        end,
    },
}

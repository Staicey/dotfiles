return {
    "stevearc/conform.nvim",
    opts = function()
        local opts = {
            default_format_opts = {
                timeout_ms = 3000,
                async = false,
                quiet = false,
                lsp_format = "fallback",
            },
            formatters_by_ft = {
                lua = { "stylua" },
                sh = { "shfmt" },
                go = { "goimports-reviser" },
            },

            formatters = {
                injected = { options = { ignore_errors = true } },
                shfmt = {
                    prepend_args = { "-ci" },
                },
                ["goimports-reviser"] = {
                    prepend_args = { "-rm-unused" },
                },
            },
        }
        return opts
    end,
}

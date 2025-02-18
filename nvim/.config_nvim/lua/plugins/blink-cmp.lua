return {
    "saghen/blink.cmp",
    opts = {
        keymap = { preset = "super-tab" },

        completion = {
            accept = {
                auto_brackets = { enabled = true },
            },

            ghost_text = {
                enabled = false,
            },

            documentation = {
                auto_show = true,
                auto_show_delay_ms = 300,
                treesitter_highlighting = false,
                window = { border = "rounded" },
            },

            menu = {
                border = "rounded",
                auto_show = true,
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label", gap = 1 },
                        { "kind" },
                    },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,

                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                    },
                },
            },
        },

        cmdline = {
            enabled = true,
            sources = function()
                local type = vim.fn.getcmdtype()
                if type == "/" or type == "?" then
                    return { "buffer" }
                end
                -- Commands
                if type == ":" or type == "@" then
                    return { "cmdline" }
                end
                return {}
            end,

            completion = {
                menu = {
                    draw = {
                        columns = { { "label", "label_description", gap = 1 } },
                    },
                },
            },
        },

        signature = {
            enabled = true,
            window = { border = "rounded" },
        },
    },
}

return {
    "saghen/blink.cmp",
    opts = {
        keymap = { preset = "super-tab" },

        completion = {
            accept = {
                auto_brackets = { enabled = true },
            },

            documentation = {
                auto_show = true,
                auto_show_delay_ms = 250,
                treesitter_highlighting = true,
                window = { border = "rounded" },
            },

            menu = {
                border = "rounded",
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

        signature = {
            enabled = true,
            window = { border = "rounded" },
        },
    },
}

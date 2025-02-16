return {
    "xzbdmw/colorful-menu.nvim",

    config = function()
        require("colorful-menu").setup({
            ls = {
                lua_ls = {
                    arguments_hl = "@comment",
                },
                gopls = {
                    align_type_to_right = true,
                    add_colon_before_type = false,
                    preserve_type_when_truncate = true,
                },

                -- If true, try to highlight "not supported" languages.
                fallback = true,
            },
            fallback_highlight = "@variable",
            max_width = 60,
        })
    end,
}

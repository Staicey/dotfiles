return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "hybrid",
        },
    },
    {
        "HoNamDuong/hybrid.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            terminal_colors = true,
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = false,
                emphasis = true,
                comments = true,
                folds = true,
            },
            strikethrough = true,
            inverse = true,
            transparent = true,
        },
    },
}

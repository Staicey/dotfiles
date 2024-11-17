return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "folke/trouble.nvim" },
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                mappings = {
                    i = { ["<c-t>"] = require("trouble.sources.telescope").open },
                    n = { ["<c-t>"] = require("trouble.sources.telescope").open },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    file_ignore_patterns = { "^./.git/", "^node_modules/" },
                },
            },
        })
        telescope.load_extension("fzf")
    end,
}

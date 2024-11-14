vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Telescope --
-- (pf) project_find (ps) project_search | (ff) find_files (fs) find_search
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep> ") })
end)

vim.keymap.set("n", "<leader>ff", function()
    builtin.find_files({ search_dirs = { vim.env.HOME .. "/scripts" } })
end)
vim.keymap.set("n", "<leader>fs", function()
    builtin.grep_string({ search = vim.fn.input("Grep> "), search_dirs = { vim.env.HOME .. "/scripts" } })
end)

vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

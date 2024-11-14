local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- autoformat go --
autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }

        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end,
})

-- When editing a file, always jump to the last cursor position
autocmd("BufReadPost", {
    group = augroup("restore-cursor-position", { clear = true }),
    pattern = "*",
    callback = function(opts)
        local last_position = vim.api.nvim_buf_get_mark(opts.buf, '"')
        local line, _ = unpack(last_position)
        local total_lines = vim.api.nvim_buf_line_count(opts.buf)
        if line ~= 0 and line <= total_lines and vim.bo.filetype ~= "gitcommit" then
            vim.api.nvim_feedkeys([[g`"]], "nx", false)
        end
    end,
})

autocmd("TextYankPost", {
    group = augroup("highlight-yanked-text", { clear = true }),
    callback = function()
        pcall(vim.highlight.on_yank, { higroup = "IncSearch", timeout = 400 })
    end,
})

-- show LSP error on hover --
vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
        }
        vim.diagnostic.open_float(nil, opts)
    end,
})

-- Set <leader> to <space>. Leader and local leader must be set before
-- initializing plugins.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.encoding = "utf-8"
opt.scrolloff = 3
opt.wildmode = "longest"

-- Fix tab whitespace --
opt.tabstop = 4 -- A TAB character looks like 4 spaces
opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
opt.shiftwidth = 4 -- Number of spaces inserted when indenting
opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character

-- Change vim insert cursor to block --
opt.guicursor = ""

-- Make searches case-sensitive only when capital letters are included.
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Wrap long lines
opt.wrap = true
opt.textwidth = 80
opt.formatoptions = { c = true, q = true, r = true, n = true, ["1"] = true }

-- Reverse chirality of splits
opt.splitbelow = true
opt.splitright = true

-- relative lines --
opt.relativenumber = true

-- Visuals --
opt.signcolumn = "yes"
opt.showcmd = false
opt.foldenable = false

opt.listchars = { tab = "▸ ", trail = "·" }
opt.conceallevel = 0
opt.concealcursor = "c"

-- Nicer diffs
opt.diffopt = { "filler", "internal", "algorithm:histogram", "indent-heuristic" }

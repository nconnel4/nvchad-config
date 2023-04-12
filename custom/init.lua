-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
local g = vim.g
local wo = vim.wo

g.mapleader = ","

-- Relative Line Numbers
wo.relativenumber = true

-- Line wrap
wo.wrap = false

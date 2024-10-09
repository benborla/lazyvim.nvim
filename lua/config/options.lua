-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.colorcolumn = "80,120"
vim.opt.pumblend = 2

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"

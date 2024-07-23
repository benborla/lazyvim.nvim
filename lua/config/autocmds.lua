-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.defer_fn(function()
  vim.cmd("highlight LineNr guifg=#ffffff guibg=none")
  vim.cmd("highlight CursorLineNr guifg=#daff24 guibg=#9d0006")
  vim.cmd("highlight CursorLine term=bold cterm=bold guibg=#1b047c")
  vim.cmd("highlight ColorColumn ctermbg=lightgrey guibg=#9d0006")
  vim.cmd("highlight ColorColumn ctermbg=red guibg=#af3a03")
  -- vim.cmd('highlight Comment guifg=#98971a')
  -- vim.cmd('highlight Variable guifg=#ECBE7B')
  vim.cmd("highlight Visual guifg=black guibg=#d79921")
  -- SET BACKGROUND TO TRANSPARENT
  vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
  vim.cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")
end, 150)

-- NeoTree
-- vim.cmd("Neotree position=right")

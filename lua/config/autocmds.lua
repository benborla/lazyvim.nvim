-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- vim.defer_fn(function()
vim.cmd("highlight LineNr guifg=#ffffff guibg=none")
vim.cmd("highlight CursorLineNr guifg=#daff24 guibg=#9d0006")
vim.cmd("highlight CursorLine term=bold cterm=bold guibg=#1b047c")
vim.cmd("highlight ColorColumn ctermbg=lightgrey guibg=#9d0006")
vim.cmd("highlight ColorColumn ctermbg=red guibg=#af3a03")
-- vim.cmd('highlight Comment guifg=#98971a')
-- vim.cmd('highlight Variable guifg=#ECBE7B')
vim.cmd("highlight Visual guifg=black guibg=#d79921")
-- SET BACKGROUND TO TRANSPARENT
-- vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")
-- end, 150)

-- Define an autocmd group for the blade workaround
local augroup = vim.api.nvim_create_augroup("lsp_blade_workaround", { clear = true })

-- Autocommand to temporarily change 'blade' filetype to 'php' when opening for LSP server activation
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup,
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "php"
  end,
})

-- Additional autocommand to switch back to 'blade' after LSP has attached
vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.blade.php",
  callback = function(args)
    vim.schedule(function()
      -- Check if the attached client is 'intelephense'
      for _, client in ipairs(vim.lsp.get_active_clients()) do
        if client.name == "intelephense" and client.attached_buffers[args.buf] then
          vim.api.nvim_buf_set_option(args.buf, "filetype", "blade")
          -- update treesitter parser to blade
          vim.api.nvim_buf_set_option(args.buf, "syntax", "blade")
          break
        end
      end
    end)
  end,
})

-- make $ part of the keyword for php.
vim.api.nvim_exec(
  [[
autocmd FileType php set iskeyword+=$
]],
  false
)

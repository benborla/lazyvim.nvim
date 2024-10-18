-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set
local keymap = vim.keymap

-- Increment/decrement
-- Increment/decrement a number
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
-- for mac press ^ + a to select all texts
keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("n", "aa", "gg<S-v>G")

-- press nww to save changes
keymap.set("n", "<C-s>", "<ESC>:w!<CR>", { silent = true })
keymap.set("i", "<C-s>", "<ESC>:w!<CR>", { silent = true })
keymap.set("n", "nww", "<ESC>:w!<CR>", { silent = true })
-- press ww to save changes when in visual mode
keymap.set("v", "ww", "<ESC>:w!<CR>", { silent = true })
-- press ww to save changes when in insert mode
keymap.set("i", "ww", "<ESC>:w!<CR>", { silent = true })
-- press qq to close file
keymap.set("n", "qq", "<ESC>:q!<CR>", { silent = true })
keymap.set("n", "qw", "<ESC>:bn | bd #<CR>", { silent = true })
keymap.set("n", "qe", "<ESC>:bw!<CR>", { silent = true })
keymap.set("n", "Q", "<ESC>:qa!<CR>", { silent = true })
-- press ii to go back to normal mode
keymap.set("i", "ii", "<ESC>", { silent = true })
keymap.set("i", "jj", "<ESC>", { silent = true })
keymap.set("v", "ii", "<ESC>", { silent = true })

keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

-- press te to open a new tab
keymap.set("n", "te", ":tabedit<Return>", { silent = true })

-- SPLIT WINDOW
-- press sg to split current file horizontally
keymap.set("n", "sg", ":split<Return><C-w>w", { silent = true })
-- press sg to split current file vertically
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

-- MOVE TO PANE
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- RESIZE WINDOW
-- press arrow left to resize window from the left
keymap.set("n", "<left>", "<C-w><")
-- press arrow right to resize window from the right
keymap.set("n", "<right>", "<C-w>>")
-- press arrow up to resize window from the up
keymap.set("n", "<up>", "<C-w>+")
-- press arrow down to resize window from the down
keymap.set("n", "<down>", "<C-w>-")

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
keymap.set("v", "yy", "vg_")

keymap.set("n", "<Space>ww", ":Telescope lsp_document_symbols<CR>")
keymap.set("n", "<Space>wf", ":Telescope lsp_document_symbols default_text=:method:<CR>")
keymap.set("n", "<Space>wv", ":Telescope lsp_document_symbols default_text=:property:<CR>")
keymap.set("n", "<Space>wo", ":Telescope lsp_document_symbols default_text=:constant:<CR>")
keymap.set("n", "<Space>wc", ":Telescope lsp_document_symbols default_text=:class:<CR>")
keymap.set("n", "<Space>wi", ":Telescope lsp_document_symbols default_text=:interface:<CR>")
keymap.set("n", "<Space>p", "<CMD>Telescope projects<CR>")

keymap.set("n", "<Space>h", "<cmd>nohl<cr>", { noremap = true, silent = true, desc = "Disable highlight" })

keymap.set(
  "n",
  "<Space>lf",
  '<cmd>lua require("conform").format({ async = true, lsp_fallback = true })<CR>',
  { noremap = true, silent = true, desc = "Format code" }
)

-- Tab Cycle
keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })

-- DELETE WITHOUT REPLACING THE CLIPBOARD (OR REGISTERING IN XCLIP)
-- black hole register strategy
-- keymap.set("n", "d", '"_d')
-- keymap.set("n", "c", '"_c')
-- keymap.set("n", "x", '"_x')
-- this will ensure that whenever your delete a text or a character it won't replaced
-- whatever you have in your clipboard.

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
keymap.set("v", "yy", "vg_")

-- @INFO: Github Copilot
-- ctrl+l to accept suggestion
-- ctrl+[ to go back to previous suggestion
-- ctrl+] to go to next suggestion
keymap.set(
  "i",
  "<C-L>",
  'copilot#Accept("<CR>")',
  { noremap = true, silent = true, expr = true, replace_keycodes = false }
)
keymap.set("i", "<C-[>", "copilot#Previous()", { noremap = true, silent = true, expr = true, replace_keycodes = false })
keymap.set("i", "<C-]>", "copilot#Next()", { noremap = true, silent = true, expr = true, replace_keycodes = false })

keymap.set("n", "\\\\", "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true, silent = true })

-- show floating diagnostic
keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { noremap = true, silent = true })

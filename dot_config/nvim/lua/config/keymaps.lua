-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- clear highlights
vim.keymap.set("n", "<Esc>", ":noh<CR>", opts)

-- save file
vim.keymap.set({ "n", "v" }, "<C-s>", "<cmd> w <CR>", opts)
vim.keymap.set("i", "<C-s>", "<Esc><cmd> w <CR>", opts)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)
vim.keymap.set("n", "<C-BS>", "<cmd>bd!<CR>", opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Replace word under cursor
vim.keymap.set("n", "<leader>j", "*``cgn", opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Copy filename with or without line to clipboard
vim.keymap.set({ "n", "v" }, "<leader>yf", ":let @+ = expand('%')<CR>", { noremap = true, silent = true })
vim.keymap.set(
  { "n", "v" },
  "<leader>yl",
  ":let @+ = expand('%')..':'..line('.')<CR>",
  { noremap = true, silent = true }
)

-- Fuzzy Search files using Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Easy escape to normal mode. No english words contain 'jf', and they're
-- typically the keys with raised bumps on them, so typing them without a bit
-- of a delay between them in insert mode will escape out to normal mode.
vim.keymap.set("i", "jf", "<Esc><Esc>", opts)

-- Neotree keymaps
vim.keymap.set("n", "-", "<cmd>Neotree close<CR>", { desc = "Close in Neotree" })
vim.keymap.set("n", "<leader><leader>", "<cmd>update", { desc = "Update" })
vim.keymap.set("n", "<leader><leader>q", "<cmd>update", { desc = "Update and quit" })

-- Fterm keymaps
local fterm = require("FTerm")
vim.keymap.set("n", "<leader>tt", function()
  fterm:toggle()
end, { desc = "[T]oggle [T]terminal" })
vim.keymap.set("t", "<leader>tt", function()
  fterm:toggle()
end, { desc = "[T]oggle [T]erminal" })

vim.keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "Format code" })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to Definition" })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Find References" })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Action" })
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })

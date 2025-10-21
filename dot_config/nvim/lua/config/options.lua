--- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.cmdheight = 2
-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true

vim.opt.expandtab = true -- Convert Tabs to spaces
vim.opt.shiftwidth = 4 --Amount to indent with << and >>

vim.opt.tabstop = 4 --How many spaces are shown per tab
vim.opt.softtabstop = 4 -- How many spaces are applied when pressing Tab

-- Keep identation from previous line
vim.opt.autoindent = true

vim.opt.breakindent = true
-- Enable break indent
-- Store undos between sessions
vim.opt.undofile = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's in statusline
vim.opt.showmode = false

-- Case-insenstive searching UNLESS \c or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on be default
vim.opt.signcolumn = "yes"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.options")

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "themes" },
    { import = "plugins.cmp" },
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
})

require("ibl").setup()

function open_float_term()
  local buf = vim.api.nvim_create_buf(false, true)
  local width = 80
  local height = 20
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = vim.o.columns - width,
    row = vim.o.lines - height,
    style = "minimal",
  }
  vim.api.nvim_open_win(buf, true, opts)
  vim.cmd("terminal")
end

vim.api.nvim_create_user_command("FloatTerm", open_float_term, {})

require("config.keymaps")
require("config.treesitter-config")

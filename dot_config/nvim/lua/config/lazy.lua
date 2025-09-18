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
    { import = "plugins.cmp" },

    -- 👇 ADD THESE MASON PLUGINS
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "gopls",
          "elixir-ls",     -- ← Note: Mason uses "elixir-ls", not "elixirls"
          "solargraph",
          -- Add more as needed: "lua_ls", "rust_analyzer", "pyright", etc.
        },
        PATH = "skip", -- Don't modify PATH - let Mason handle binaries internally
      },
    },
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = { "neovim/nvim-lspconfig" },
      opts = {
        -- Map Mason registry names to lspconfig setup names if different
        -- e.g., Mason calls it "elixir-ls", but lspconfig expects "elixirls"
        ensure_installed = { "gopls", "elixirls", "solargraph" },
        handlers = {
          -- You can define custom setup per server here, or let it auto-setup
          gopls = function()
            require("lspconfig").gopls.setup({
              filetypes = { "go", "gomod", "gowork", "gotmpl" },
              root_dir = require("lspconfig").util.root_pattern("go.work", "go.mod", ".git"),
              settings = {
                gopls = {
                  analyses = {
                    unusedparams = true,
                  },
                  staticcheck = true,
                  completeUnimported = true,
                  usePlaceholders = true,
                },
              },
            })
          end,

          elixirls = function()
            require("lspconfig").elixirls.setup({
              cmd = { "elixir-ls" }, -- ← Mason installs binary as "elixir-ls"
              filetypes = { "elixir", "eelixir" },
              root_dir = require("lspconfig").util.root_pattern("mix.exs", ".git"),
            })
          end,

          solargraph = function()
            require("lspconfig").solargraph.setup({
              cmd = { "solargraph", "stdio" },
              filetypes = { "ruby" },
              init_options = { formatting = false },
              settings = { solargraph = { diagnostics = true } },
            })
          end,

          -- Fallback for other servers
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
      },
    },

    -- 👇 KEEP nvim-lspconfig — now managed by Mason
    {
      "neovim/nvim-lspconfig",
      -- No need for manual config anymore — handled by mason-lspconfig handlers above
    },
  },
  install = { colorscheme = { "tokyonight-storm" } },
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

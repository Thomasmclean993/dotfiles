-- ~/.config/nvim/lua/plugins/neotest.lua
return {
  "nvim-neotest/neotest",
  ft = { "ruby", "elixir", "zig" }, -- load when opening these test files
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
    "jfpedroza/neotest-elixir",
    "lawrence-laz/neotest-zig",
  },
  config = function()
    local neotest = require("neotest")

    -- build adapters list safely so one broken adapter doesn’t kill them all
    local adapters = {}

    local ok_rspec, rspec = pcall(require, "neotest-rspec")
    if ok_rspec then
      table.insert(adapters, rspec({}))
    end

    local ok_elixir, elixir = pcall(require, "neotest-elixir")
    if ok_elixir then
      table.insert(adapters, elixir({}))
    end

    local ok_zig, zig = pcall(require, "neotest-zig")
    if ok_zig then
      table.insert(adapters, zig({ dap = { adapter = "lldb" } }))
    end

    neotest.setup({ adapters = adapters })

    ------------------------------------------------------------------------
    -- Keymaps (only defined once plugin + adapters are alive)
    ------------------------------------------------------------------------
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<leader>tn", function()
      neotest.run.run()
    end, vim.tbl_extend("force", opts, { desc = "Run nearest test" }))

    map("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, vim.tbl_extend("force", opts, { desc = "Run file tests" }))

    map("n", "<leader>td", function()
      neotest.run.run({ strategy = "dap" })
    end, vim.tbl_extend("force", opts, { desc = "Debug nearest test" }))

    map("n", "<leader>ts", function()
      neotest.run.stop()
    end, vim.tbl_extend("force", opts, { desc = "Stop running test" }))

    map("n", "<leader>ta", function()
      neotest.run.attach()
    end, vim.tbl_extend("force", opts, { desc = "Attach to nearest running test" }))

    map("n", "<leader>to", function()
      neotest.output.open({ enter = true })
    end, vim.tbl_extend("force", opts, { desc = "Show test output" }))

    map("n", "<leader>tt", function()
      neotest.summary.toggle()
    end, vim.tbl_extend("force", opts, { desc = "Toggle test summary panel" }))
  end,
}

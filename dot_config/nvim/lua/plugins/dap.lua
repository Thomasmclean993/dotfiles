return {
  "mfussenegger/nvim-dap",
  config = function()
    require("plugins.dap")
  end,
  dependencies = {
    "rcarriga/nvim-dap-ui", -- optional but handy UI
    "jay-babu/mason-nvim-dap.nvim", -- optional mason integration
  },
}

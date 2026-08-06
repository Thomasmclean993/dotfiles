-- Alternative: install github/copilot.vim via lazy.nvim
return {
  "zbirenbaum/copilot.lua",
  opts = {
  suggestion = {
    enabled = not vim.g.ai_cmp,
    auto_trigger = true,
    hide_during_completion = vim.g.ai_cmp,
    keymap = {
     accept = "<C-/>", -- handled by nvim-cmp / blink.cmp
      next = "<C-.>",
      prev = "<C-m>"
    },
  },
  panel = { enabled = false },
  filetypes = {
    markdown = true,
    elixir = true,
    ruby = true,
    go = true,
    lua = true,
    help = true,
  },
},
}

-- ~/.config/nvim/lua/plugins/lsp.lua
-- Only global LSP configuration — no server setups (handled by Mason)

-- Diagnostics signs in sign column
local signs = { Error = "x", Warn = "!", Hint = "?", Info = "i" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Set omnifunc globally for all buffers after LSP attaches
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- Skip prompt buffers
    if vim.bo.filetype == "prompt" or vim.bo.filetype == "TelescopePrompt" then
      return
    end
    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  end,
})

-- Optional: Format on save for specific filetypes
-- Uncomment if you want auto-formatting (e.g., for Go)

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Optional: Highlight symbol under cursor
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    if not vim.b.lsp_buffer_attached then
      vim.b.lsp_buffer_attached = true
      vim.lsp.buf.highlight_definitions()
    end
  end,
})

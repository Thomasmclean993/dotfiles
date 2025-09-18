return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",     -- 👈 ADD THIS LINE
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    -- ✅ Get LSP capabilities (important for snippet support + LSP features)
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text", -- show icon + text
          max_width = 50,       -- prevent popup from being too wide
          ellipsis_char = "...",-- truncate long lines with ...
        }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },    -- ← now works because cmp-nvim-lsp is installed
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      -- 👇 Apply the shared capabilities to cmp
      capabilities = capabilities,
    })

    vim.cmd([[
      set completeopt=menuone,noinsert,noselect
      highlight! default link CmpItemKind CmpItemMenuDefault
    ]])
  end,
}

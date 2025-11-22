-- plugins/themery.lua (or wherever you configure themery)
return {
  "zaldih/themery.nvim",
  config = function()
    -- Make sure Neovim can find your themes folder
    vim.opt.runtimepath:append(vim.fn.stdpath("config") .. "/themes")

    require("themery").setup({
      themes = {
        {
          name = "bamboo",
          colorscheme = "bamboo",
        },
        {
          name = "kanagawa-paper",
          colorscheme = "kanagawa-paper",
        },
        {
          name = "eldritch",
          colorscheme = "eldritch",
        },
        {
          name = "miasma",
          colorscheme = "miasma",
        },
        {
          name = "nightfox",
          colorscheme = "nightfox",
        },
        {
          name = "tokyodark",
          colorscheme = "tokyodark",
        },
        {
          name = "tokyonight",
          colorscheme = "tokyonight",
        },
      },
      livePreview = true,
    })
  end
}

-- A tiny Neovim plugin that adds subtle animations to various operations.
-- https://github.com/rachartier/tiny-glimmer.nvim
return {
  "rachartier/tiny-glimmer.nvim",
  event = "VeryLazy",
  priority = 10, -- Needs to be a really low priority, to catch others plugins keybindings.
  opts = {
    -- your configuration
    overwrite = {
      yank = {
        default_animation = "bounce",
      },
      paste = {
        default_animation = "left_to_right",
        paste_mapping = "p",
        Paste_mapping = "P",
      },
    },
    animations = {
      bounce = {
        max_duration = 500,
        min_duration = 400,
        chars_for_max_duration = 20,
        oscillation_count = 1,
        from_color = "#03c03c",
        to_color = "#009e60",
      },
      left_to_right = {
        max_duration = 350,
        min_duration = 350,
        min_progress = 0.85,
        chars_for_max_duration = 25,
        lingering_time = 50,
        from_color = "#fb4f14",
        to_color = "#648c11",
      },
    },
  },
}

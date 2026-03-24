return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    flavour = "mocha",
    transparent_background = "true",
    -- transparency function for blink
    custom_highlights = function(colors)
      return {
        NormalFloat = { bg = "NONE" },
        FloatBorder = { fg = colors.surface2, bg = "NONE" },
        ColorColumn = { bg = colors.surface0 },
      }
    end,
  },
}

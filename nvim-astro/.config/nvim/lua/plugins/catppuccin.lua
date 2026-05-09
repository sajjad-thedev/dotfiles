return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- load before everything else
  lazy = false, -- load at startup, not lazily
  opts = {
    flavour = "mocha",
    transparent_background = true,
    auto_integrations = true,
    integrations = {
      snacks = {
        indent_scope_color = "lavender",
      },
    },
    custom_highlights = function(colors)
      return {
        NormalFloat = { bg = "NONE" },
        FloatBorder = { fg = colors.surface2, bg = "NONE" },
        ColorColumn = { bg = colors.surface0 },
      }
    end,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
  end,
}

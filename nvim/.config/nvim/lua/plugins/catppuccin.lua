return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      term_colors = true,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        mini = true,
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        snacks = true,
        telescope = true,
        treesitter_context = true,
        which_key = true,
      },
      custom_highlights = function(colors)
        return {
          -- Main UI
          Normal = { bg = "none" },
          NormalNC = { bg = "none" },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },

          -- Floating Windows (LSP Diagnostics, etc.)
          LspFloatWinNormal = { bg = "none" },
          DiagnosticFloatingError = { bg = "none" },
          DiagnosticFloatingWarn = { bg = "none" },
          DiagnosticFloatingInfo = { bg = "none" },
          DiagnosticFloatingHint = { bg = "none" },

          -- Borders and Splits
          WinSeparator = { fg = colors.surface2, bg = "none" },
          LineNr = { bg = "none" },
          CursorLineNr = { bg = "none" },
          SignColumn = { bg = "none" },
          StatusLine = { bg = "none" },
          StatusLineNC = { bg = "none" },
        }
      end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  { "folke/tokyonight.nvim", enabled = true },
}

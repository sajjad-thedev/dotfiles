-- Undo tree visualization
return {
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undo Tree" },
    },
  },
  -- Better code actions UI
  {
    "aznhe21/actions-preview.nvim",
    keys = {
      {
        "<leader>ca",
        function()
          require("actions-preview").code_actions()
        end,
        mode = { "n", "v" },
        desc = "Code Action Preview",
      },
    },
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      -- You can customize the animation speed or color here
      smear_between_buffers = true,
      cursor_color = "#d3abe1", -- Optional: match your theme
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*", "!lazy" },
      user_default_options = {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        names = true,    -- "Color names" like Blue or Red
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS functions: rgb_fn, hsl_fn
        -- Highlighting mode: 'background', 'foreground', or 'virtualtext'
        mode = "background",
        tailwind = true,                               -- Enable tailwind colors
        sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
      },
    },
  },
}

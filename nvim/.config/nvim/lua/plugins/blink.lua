return {
  "Saghen/blink.cmp",
  opts = {
    appearance = {
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        buffer = {
          min_keyword_length = 2,
          max_items = 5,
        },
      },
    },
    cmdline = {
      enabled = true,
      sources = { "cmdline" },
      keymap = { preset = "cmdline" },
      completion = {
        menu = { auto_show = true },
      },
    },
    completion = {
      list = {
        selection = {
          preselect = true, -- auto-selects first item
          auto_insert = false, -- don't insert text until you actually accept
        },
      },
      menu = {
        border = "single",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        draw = {
          treesitter = { "lsp" },
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", gap = 1, "kind" },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "single",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
      },
      ghost_text = { enabled = true },
    },
    signature = { enabled = true },
  },
}

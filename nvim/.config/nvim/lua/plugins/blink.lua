-- ~/.config/nvim/lua/plugins/blink.lua
-- NvChad-inspired blink.cmp overhaul for LazyVim + Catppuccin Mocha
-- Fixed: "sources -> compat" error and added Tab navigation

return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "*",

  opts = function(_, opts)
    -- 1. Fix the "Unexpected field" error by removing LazyVim's default compat field
    if opts.sources then
      opts.sources.compat = nil
    end

    -- 2. Define clean sources
    opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
      default = { "lsp", "path", "snippets", "buffer" },
    })

    -- 3. Navigation: Tab to select next/jump, S-Tab to select prev/jump back
    opts.keymap = {
      preset = "enter", -- Keep Enter for confirmation
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    }

    -- 4. Visual Overhaul (NvChad Style)
    opts.completion = {
      menu = {
        border = "rounded",
        winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
        draw = {
          gap = 1,
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "kind" },
          },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                return ctx.kind_icon .. " "
              end,
              highlight = function(ctx)
                return "BlinkCmpKind" .. ctx.kind
              end,
            },
            label = {
              width = { fill = true, max = 40 },
              text = function(ctx)
                return ctx.label .. (ctx.label_detail or "")
              end,
              highlight = function(ctx)
                local highlights = {}
                if ctx.deprecated then
                  table.insert(highlights, { 0, #ctx.label, group = "BlinkCmpLabelDeprecated" })
                else
                  for _, idx in ipairs(ctx.label_matched_indices or {}) do
                    table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
                  end
                end
                return highlights
              end,
            },
            kind = {
              ellipsis = false,
              width = { fill = false },
              text = function(ctx)
                return ctx.kind
              end,
              highlight = function(ctx)
                return "BlinkCmpKind" .. ctx.kind
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
        window = {
          border = "rounded",
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        },
      },
      ghost_text = { enabled = false },
      list = {
        selection = { preselect = true, auto_insert = false },
      },
    }

    opts.appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    }

    return opts
  end,

  -- 5. Highlight Configurations
  config = function(_, opts)
    require("blink.cmp").setup(opts)

    local mocha = {
      mantle = "#181825",
      surface0 = "#313244",
      surface1 = "#45475a",
      overlay0 = "#6c7086",
      overlay1 = "#7f849c",
      text = "#cdd6f4",
      blue = "#89b4fa",
      sapphire = "#74c7ec",
      teal = "#94e2d5",
      green = "#a6e3a1",
      yellow = "#f9e2af",
      peach = "#fab387",
      mauve = "#cba6f7",
      pink = "#f5c2e7",
      sky = "#89dceb",
      lavender = "#b4befe",
    }

    local function hi(name, val)
      vim.api.nvim_set_hl(0, name, val)
    end

    hi("BlinkCmpMenu", { link = "NormalFloat" })
    hi("BlinkCmpMenuBorder", { fg = mocha.surface1 })
    hi("BlinkCmpMenuSelection", { bg = mocha.surface0, bold = true })
    hi("BlinkCmpDoc", { link = "NormalFloat" })
    hi("BlinkCmpDocBorder", { fg = mocha.surface1 })
    hi("BlinkCmpDocCursorLine", { bg = mocha.surface0 })
    hi("BlinkCmpLabel", { fg = mocha.text, bg = mocha.mantle })
    hi("BlinkCmpLabelDeprecated", { fg = mocha.overlay0, bg = mocha.mantle, strikethrough = true })
    hi("BlinkCmpLabelMatch", { fg = mocha.blue, bold = true })
    hi("BlinkCmpLabelDetail", { fg = mocha.overlay1 })
    hi("BlinkCmpLabelDescription", { fg = mocha.overlay1 })
    hi("BlinkCmpGhostText", { fg = mocha.overlay0, italic = true })
    hi("BlinkCmpKindText", { fg = mocha.text })
    hi("BlinkCmpKindMethod", { fg = mocha.blue })
    hi("BlinkCmpKindFunction", { fg = mocha.blue })
    hi("BlinkCmpKindConstructor", { fg = mocha.sapphire })
    hi("BlinkCmpKindField", { fg = mocha.teal })
    hi("BlinkCmpKindVariable", { fg = mocha.peach })
    hi("BlinkCmpKindClass", { fg = mocha.yellow })
    hi("BlinkCmpKindInterface", { fg = mocha.yellow })
    hi("BlinkCmpKindModule", { fg = mocha.blue })
    hi("BlinkCmpKindProperty", { fg = mocha.teal })
    hi("BlinkCmpKindUnit", { fg = mocha.green })
    hi("BlinkCmpKindValue", { fg = mocha.peach })
    hi("BlinkCmpKindEnum", { fg = mocha.yellow })
    hi("BlinkCmpKindKeyword", { fg = mocha.mauve })
    hi("BlinkCmpKindSnippet", { fg = mocha.green })
    hi("BlinkCmpKindColor", { fg = mocha.pink })
    hi("BlinkCmpKindFile", { fg = mocha.blue })
    hi("BlinkCmpKindReference", { fg = mocha.lavender })
    hi("BlinkCmpKindFolder", { fg = mocha.blue })
    hi("BlinkCmpKindEnumMember", { fg = mocha.teal })
    hi("BlinkCmpKindConstant", { fg = mocha.peach })
    hi("BlinkCmpKindStruct", { fg = mocha.yellow })
    hi("BlinkCmpKindEvent", { fg = mocha.pink })
    hi("BlinkCmpKindOperator", { fg = mocha.sky })
    hi("BlinkCmpKindTypeParameter", { fg = mocha.teal })
  end,
}

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = { "prettier" },
        css = { "prettier" },
        javascript = { "prettier" },
        python = { "ruff_format" }, -- or { "black" }
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
    },
  },
}

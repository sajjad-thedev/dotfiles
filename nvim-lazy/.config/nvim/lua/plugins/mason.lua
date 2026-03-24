return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      -- Add items to the ensure_installed list
      -- This list matches exactly what you have in your Mason screenshot
      vim.list_extend(opts.ensure_installed, {
        -- LSPs
        "css-lsp",
        "html-lsp",
        "lua-language-server",
        -- Shell/System
        "shfmt",
        "stylua",
        -- These are usually handled by extras,
        -- but adding them here makes it "bulletproof"
        "clang-format",
        "markdown-toc",
        "markdownlint-cli2",
        "marksman",
        "pyright",
        "ruff",
      })
    end,
  },
}

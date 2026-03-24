return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      -- LSP servers
      "pyright", -- Python
      "html-lsp", -- HTML
      "css-lsp", -- CSS
      "typescript-language-server", -- JavaScript/TypeScript

      -- Formatters
      "clang-format", -- C
      "black", -- Python
      "prettier", -- HTML, CSS, JS
      "codelldb",
    },
  },
}

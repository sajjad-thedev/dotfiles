---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "c",
      "python",
      "html",
      "css",
      "javascript",
      "typescript",
      "lua", -- good to have for your config files
    },
  },
}

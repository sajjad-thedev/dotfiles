return {
  "folke/which-key.nvim",
  opts = {
    preset = "helix",
    -- group labels like LazyVim
    spec = {
      { "<Leader>b", group = "buffer" },
      { "<Leader>c", group = "code" },
      { "<Leader>f", group = "file/find" },
      { "<Leader>g", group = "git" },
      { "<Leader>l", group = "lsp" },
      { "<Leader>s", group = "search" },
      { "<Leader>t", group = "terminal" },
      { "<Leader>u", group = "ui" },
      { "<Leader>d", group = "debug" },
      { "<Leader>S", group = "session" },
      { "gs", group = "surround" },
      { "[", group = "prev" },
      { "]", group = "next" },
      { "g", group = "goto" },
      { "z", group = "fold" },
    },
  },
}

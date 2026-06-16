return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- show hidden files but dimmed
        hide_dotfiles = false, -- show dotfiles
        hide_gitignored = true, -- still hide gitignored files
        hide_by_name = {
          ".git",
          "node_modules",
        },
      },
    },
  },
}

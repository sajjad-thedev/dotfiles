return {
  "epwalsh/obsidian.nvim",
  version = "*", -- use latest release instead of main branch
  lazy = true,
  ft = "markdown",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/Obsidian Notes/", -- CHANGE THIS to your actual vault path
      },
    },
    -- Settings for how images are handled
    attachments = {
      img_folder = "Assets", -- matches the 'assets' folder we set up in Obsidian
    },
  },
}

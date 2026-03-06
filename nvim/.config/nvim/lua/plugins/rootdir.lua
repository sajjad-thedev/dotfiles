return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },
      patterns = {
        ".git",
        "Makefile",
        "package.json",
        "pyproject.toml",
        "pom.xml",
        "cargo.toml",
        ".python-version",
      },
      show_hidden = true,
    },
    event = "VeryLazy",
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
          },
          grep = {
            hidden = true,
          },
        },
      },
      explorer = {
        replace_netrw = true,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      root_dir = function(fname)
        return require("lspconfig.util").find_git_ancestor(fname) or vim.fn.fnamemodify(fname, ":h")
      end,
    },
  },
}

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      highlight = { enabled = true }, -- enable/disable treesitter based highlighting
      indent = { enabled = true }, -- enable/disable treesitter based indentation
      auto_install = false, -- enable/disable automatic installation of detected languages
      ensure_installed = {
        "lua",
        "vim",
        -- add more arguments for adding more treesitter parsers
        "c",
        "cpp",
      },
    },
  },
}

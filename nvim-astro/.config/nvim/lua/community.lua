---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.colorscheme.catppuccin" },
  -- nvchad snacks picker theme
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.search.grug-far-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
}

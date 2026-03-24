-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true

vim.opt.updatetime = 200 -- Faster completion
vim.opt.timeoutlen = 300 -- Faster key sequence completion
-- Enable line wrapping
vim.opt.wrap = true

-- Make wrapped lines visually indent to match the start of the line
vim.opt.breakindent = true

-- Ensure lines don't break in the middle of a word
vim.opt.linebreak = true

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- This forces the vertical split line to a specific color
    -- Change #45475a to a brighter color like #ffffff if you want it pure white
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#6c7086", bold = true })
    vim.api.nvim_set_hl(0, "VertSplit", { fg = "#45475a", bold = true })
    vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#45475a", bold = true })
  end,
})

-- Trigger it immediately for the current session
vim.cmd("doautocmd ColorScheme")

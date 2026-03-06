-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Reduce notification spam
vim.opt.updatetime = 200 -- Faster completion
vim.opt.timeoutlen = 300 -- Faster key sequence completion
-- Enable line wrapping
vim.opt.wrap = true

-- Make wrapped lines visually indent to match the start of the line
vim.opt.breakindent = true

-- Ensure lines don't break in the middle of a word
vim.opt.linebreak = true
-- Disable some LSP notifications
vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  local lvl = ({ "ERROR", "WARN", "INFO", "DEBUG" })[result.type]
  -- Only show errors and warnings
  if result.type <= 2 then
    vim.notify(result.message, lvl, {
      title = "LSP | " .. client.name,
    })
  end
end

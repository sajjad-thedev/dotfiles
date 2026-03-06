-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape to Normal Mode" })

-- Mobile Live Preview Shortcut
vim.keymap.set("n", "<leader>lm", function()
  -- The command you provided
  local cmd = "chromium --app='http://localhost:8080' "
      .. "--user-agent='Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X)' "
      .. "--window-size=375,812"

  -- jobstart runs this in the background
  -- and handles the '&' automatically
  vim.fn.jobstart(cmd, { detach = true })

  -- Optional: Notification to confirm it's launching
  vim.notify("Launching Mobile Preview...", vim.log.levels.INFO)
end, { desc = "Mobile Live Preview (Chrome)" })

-- Paste over selected text without overwriting the register with the deleted text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Find files (now includes hidden files by default)
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep Search" })
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find" })

-- Escape to normal mode with jk keymap
vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape to Normal Mode" })

-- Paste over selected text without overwriting the register with the deleted text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Scrolling and centering the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Set ctrl-; to add a ";" to the end of the line
vim.keymap.set('i', '<C-;>', '<Esc>A;<Esc>', { desc = 'Append semicolon from insert' })

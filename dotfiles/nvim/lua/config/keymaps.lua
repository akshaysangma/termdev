-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Better escape: jk in insert mode
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

-- Keep cursor centered on search results
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Paste without losing register (paste over selection keeps original in register)
map("x", "<leader>p", '"_dP', { desc = "Paste without losing register" })

-- Delete to void register (delete without yanking)
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete to void register" })

-- Quick save
map({ "n", "i", "v", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Select all
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Better indenting (stay in visual mode)
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move to start/end of line (easier than ^ and $)
map({ "n", "v" }, "H", "^", { desc = "Start of line" })
map({ "n", "v" }, "L", "$", { desc = "End of line" })

-- Quick close buffer
map("n", "<leader>x", "<cmd>bd<cr>", { desc = "Close buffer" })

-- Open terminal in split
map("n", "<leader>tt", function()
  vim.cmd("split | terminal")
end, { desc = "Terminal (horizontal)" })

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Disable unused providers (silences checkhealth warnings)
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Scrolloff: keep 8 lines visible above/below cursor
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Shorter update time for faster diagnostics and gitsigns
vim.opt.updatetime = 200

-- Split behavior: open new splits to right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Search: smart case (case-insensitive unless you use capitals)
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Line numbers: relative for fast jumping (5j, 12k)
vim.opt.relativenumber = true

-- Confirm before closing unsaved buffer instead of error
vim.opt.confirm = true

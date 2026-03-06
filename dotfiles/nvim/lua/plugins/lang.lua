return {
  -- Laravel Blade support
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },

  -- Laravel tooling (Artisan commands, routes, etc.)
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>", desc = "Laravel Artisan" },
      { "<leader>lr", ":Laravel routes<cr>", desc = "Laravel Routes" },
    },
    opts = {},
  },

  -- Ensure LSP servers and tools are installed
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Go
        "gopls",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "delve",
        -- PHP
        "intelephense",
        "php-cs-fixer",
        "phpstan",
        -- TypeScript
        "typescript-language-server",
        "prettier",
        "eslint-lsp",
      },
    },
  },
}

# termdev

Terminal-first development environment for macOS (Apple Silicon).

Ghostty + tmux + Neovim/LazyVim + Claude Code CLI. Catppuccin Mocha everywhere.

## Quick Start (new machine)

```bash
git clone https://github.com/akshaysangma/termdev.git
cd termdev
chmod +x setup.sh
./setup.sh
```

The setup script installs all tools via Homebrew, symlinks configs from `dotfiles/`, and bootstraps LazyVim + tmux plugins.

## What's Inside

```
termdev/
├── STACK.md          # Stack choices and reasoning
├── GUIDE.md          # Usage guide, shortcuts, workflows, Claude Code tips
├── setup.sh          # One-command setup script
└── dotfiles/         # All configuration files
    ├── ghostty/      # Terminal emulator
    ├── nvim/         # Neovim/LazyVim (options, keymaps, plugins)
    ├── tmux/         # tmux (sessions, splits, plugins)
    ├── starship/     # Shell prompt
    ├── bat/          # cat replacement
    ├── yazi/         # File manager
    ├── zshrc         # Shell config (aliases, functions, plugins)
    └── gitconfig     # Git + delta config (reference only)
```

## Docs

- **[STACK.md](STACK.md)** — Why each tool was chosen over alternatives
- **[GUIDE.md](GUIDE.md)** — Practical usage: shortcuts, workflows, Claude Code integration

## Updating Configs

Configs are **symlinked** — edit either the dotfile or the actual config location and both stay in sync:

```bash
# These are the same file:
nvim ~/.config/ghostty/config
nvim ~/github.com/akshaysangma/termdev/dotfiles/ghostty/config
```

After making changes, commit and push from this repo.

## The Stack

| Layer       | Tool                                                             |
| ----------- | ---------------------------------------------------------------- |
| Terminal    | Ghostty                                                          |
| Shell       | Zsh + Starship + autosuggestions + syntax-highlighting + fzf-tab |
| Multiplexer | tmux + TPM + catppuccin + resurrect + continuum                  |
| Editor      | Neovim + LazyVim + claudecode.nvim                               |
| Git         | lazygit + delta                                                  |
| Files       | yazi                                                             |
| AI          | Claude Code CLI                                                  |
| CLI         | eza, bat, ripgrep, fd, zoxide, fzf, btop, delta, sd, jq, tldr    |
| Font        | JetBrains Mono Nerd Font                                         |
| Theme       | Catppuccin Mocha                                                 |

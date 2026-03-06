#!/usr/bin/env bash
set -euo pipefail

# Terminal Dev Stack Setup Script
# Installs tools, symlinks dotfiles from this repo
# Run: chmod +x setup.sh && ./setup.sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES="$SCRIPT_DIR/dotfiles"

echo "=================================="
echo "  Terminal Dev Stack Setup"
echo "=================================="
echo ""

# ─── Helpers ──────────────────────────────────────────────────────────────────

link_config() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"

  if [ -L "$dest" ]; then
    rm "$dest"
  elif [ -e "$dest" ]; then
    echo "  [BACKUP] $dest -> ${dest}.bak"
    mv "$dest" "${dest}.bak"
  fi

  ln -sf "$src" "$dest"
  echo "  [LINK] $(basename "$src") -> $dest"
}

# ─── Phase 1: Homebrew ────────────────────────────────────────────────────────

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "[OK] Homebrew found"
fi

# ─── Phase 2: Install packages ───────────────────────────────────────────────

echo ""
echo "==> Installing packages..."

# Core stack
brew install ghostty neovim tmux lazygit yazi starship

# CLI power tools
brew install fzf ripgrep eza bat fd zoxide git-delta btop tldr sd jq

# Language tools
brew install golangci-lint

# Zsh plugins
brew install zsh-autosuggestions zsh-syntax-highlighting

# Font
brew install --cask font-jetbrains-mono-nerd-font 2>/dev/null || echo "[OK] Font already installed"

echo "[OK] All packages installed"

# ─── Phase 3: Clone dependencies ─────────────────────────────────────────────

echo ""
echo "==> Cloning dependencies..."

# tmux Plugin Manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "[OK] TPM cloned"
else
  echo "[OK] TPM exists"
fi

# fzf-tab (not in Homebrew)
if [ ! -d "$HOME/.config/fzf-tab" ]; then
  git clone https://github.com/Aloxaf/fzf-tab ~/.config/fzf-tab
  echo "[OK] fzf-tab cloned"
else
  echo "[OK] fzf-tab exists"
fi

# LazyVim starter
if [ ! -d "$HOME/.config/nvim" ]; then
  git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
  rm -rf "$HOME/.config/nvim/.git"
  rm -f "$HOME/.config/nvim/lua/plugins/example.lua"
  echo "[OK] LazyVim cloned"
else
  echo "[OK] Neovim config exists"
fi

# ─── Phase 4: Symlink dotfiles ───────────────────────────────────────────────

echo ""
echo "==> Linking dotfiles..."

# Ghostty
link_config "$DOTFILES/ghostty/config" "$HOME/.config/ghostty/config"

# tmux
link_config "$DOTFILES/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

# Starship
link_config "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"

# bat
link_config "$DOTFILES/bat/config" "$HOME/.config/bat/config"

# yazi
link_config "$DOTFILES/yazi/yazi.toml" "$HOME/.config/yazi/yazi.toml"

# Zsh
link_config "$DOTFILES/zshrc" "$HOME/.zshrc"

# Neovim — overlay our customizations onto the LazyVim starter
link_config "$DOTFILES/nvim/lua/config/lazy.lua" "$HOME/.config/nvim/lua/config/lazy.lua"
link_config "$DOTFILES/nvim/lua/config/options.lua" "$HOME/.config/nvim/lua/config/options.lua"
link_config "$DOTFILES/nvim/lua/config/keymaps.lua" "$HOME/.config/nvim/lua/config/keymaps.lua"
link_config "$DOTFILES/nvim/lua/plugins/claudecode.lua" "$HOME/.config/nvim/lua/plugins/claudecode.lua"
link_config "$DOTFILES/nvim/lua/plugins/lang.lua" "$HOME/.config/nvim/lua/plugins/lang.lua"

# Git — delta config only (preserves user identity)
if ! grep -q '\[delta\]' "$HOME/.gitconfig" 2>/dev/null; then
  git config --global core.pager delta
  git config --global interactive.diffFilter "delta --color-only"
  git config --global delta.navigate true
  git config --global delta.side-by-side true
  git config --global delta.line-numbers true
  git config --global "delta.syntax-theme" "Catppuccin Mocha"
  git config --global merge.conflictstyle zdiff3
  echo "  [OK] git delta config added"
else
  echo "  [OK] git delta config exists"
fi

echo ""
echo "[OK] All dotfiles linked"

# ─── Phase 5: Post-install ────────────────────────────────────────────────────

echo ""
echo "==> Post-install..."

# bat Catppuccin theme
mkdir -p "$HOME/.config/bat/themes"
if [ ! -f "$HOME/.config/bat/themes/Catppuccin Mocha.tmTheme" ]; then
  curl -sL "https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Mocha.tmTheme" \
    -o "$HOME/.config/bat/themes/Catppuccin Mocha.tmTheme"
  bat cache --build 2>/dev/null
  echo "[OK] bat Catppuccin theme installed"
fi

# Install tmux plugins
if [ -x "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]; then
  "$HOME/.tmux/plugins/tpm/bin/install_plugins"
  echo "[OK] tmux plugins installed"
fi

# Update tldr pages
tldr --update 2>/dev/null || true

echo ""
echo "=================================="
echo "  Setup complete!"
echo "=================================="
echo ""
echo "Next steps:"
echo "  1. Restart terminal or: source ~/.zshrc"
echo "  2. Open nvim — plugins auto-install on first launch"
echo "  3. Update ~/.gitconfig with your name, email, signing key"
echo "  4. Install Claude Code: npm install -g @anthropic-ai/claude-code"
echo ""
echo "Verify: open Ghostty, run 'tmux', then 'nvim .'"
echo ""

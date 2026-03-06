# Terminal Development Stack

A curated, modern terminal-first development environment for macOS (Apple Silicon).

## Philosophy

- **Keyboard-driven** — minimize mouse dependency, maximize flow state
- **Fast** — GPU-accelerated terminal, Rust/Go CLI tools, instant startup
- **Composable** — each tool does one thing well, all work together
- **AI-native** — optimized for Claude Code CLI workflows
- **Minimal config** — sensible defaults, only customize what matters

---

## The Stack

### 1. Terminal Emulator: Ghostty

**Why Ghostty over alternatives:**

| Considered | Verdict                                                                                        |
| ---------- | ---------------------------------------------------------------------------------------------- |
| Ghostty    | **Winner** — fastest benchmarks, native macOS UI, GPU-accelerated, built by Mitchell Hashimoto |
| WezTerm    | Great cross-platform option, Lua config, but heavier on macOS                                  |
| Kitty      | Linux-first, less native on macOS                                                              |
| Alacritty  | Fast but no splits/tabs by design — needs tmux for everything                                  |
| iTerm2     | Mature but slow compared to GPU terminals, Electron-like feel                                  |

**Key reasons:**

- Native macOS integration (not Electron)
- Built-in splits and tabs (can replace tmux for local work)
- Quick Terminal drop-down (`Cmd+backtick`)
- 300+ built-in themes
- Hot-reload config (`Cmd+Shift+,`)
- Zero config needed to get started

### 2. Shell: Zsh

**Why Zsh over alternatives:**

| Considered | Verdict                                                                        |
| ---------- | ------------------------------------------------------------------------------ |
| Zsh        | **Winner** — macOS default, POSIX-compatible, massive plugin ecosystem         |
| Fish       | Excellent out-of-box experience but not POSIX-compatible, breaks some scripts  |
| Nushell    | Innovative structured data model but still maturing, poor script compatibility |
| Bash       | Universal but lacks modern features without heavy configuration                |

**Key reasons:**

- Already the macOS default — no migration friction
- POSIX-compatible — all existing scripts work
- With autosuggestions + syntax highlighting plugins, matches Fish's UX
- Starship prompt replaces heavy theme frameworks like Oh My Zsh

### 3. Prompt: Starship

**Why Starship over Oh My Zsh themes:**

- Cross-shell (works with Zsh, Fish, Bash, Nushell)
- Written in Rust — instant prompt rendering, no lag
- Shows only relevant info (git branch, Node version, etc.) contextually
- Single binary, no framework overhead
- Oh My Zsh loads 100+ files on shell startup; Starship is near-zero overhead

### 4. Multiplexer: tmux

**Why tmux over alternatives:**

| Considered            | Verdict                                                                 |
| --------------------- | ----------------------------------------------------------------------- |
| tmux                  | **Winner** — proven (17+ years), session persistence, deepest ecosystem |
| Zellij                | Modern UX with discoverable keybinds, but younger ecosystem             |
| Ghostty native splits | Good for local, but no session persistence or detach/reattach           |

**Key reasons:**

- Session persistence — detach and reattach across SSH, reboots, crashes
- Claude Code agent teams — each agent gets its own visible pane
- Scriptable layouts — save and restore complex window arrangements
- Universal — works on every remote server you'll SSH into
- Massive plugin ecosystem (TPM, catppuccin theme, etc.)

### 5. Editor: Neovim (via LazyVim)

**Why Neovim over Vim/Helix:**

| Considered | Verdict                                                                   |
| ---------- | ------------------------------------------------------------------------- |
| Neovim     | **Winner** — native LSP, Treesitter, Lua config, massive plugin ecosystem |
| Vim        | No built-in LSP or Treesitter, VimScript is painful                       |
| Helix      | Great defaults but small plugin ecosystem, no mature AI integrations      |

**Why LazyVim as the distribution:**

| Considered     | Verdict                                                                  |
| -------------- | ------------------------------------------------------------------------ |
| LazyVim        | **Winner** — productive in 5 minutes, well-maintained, easy to customize |
| kickstart.nvim | Great for learning but requires more setup time                          |
| AstroNvim      | Good but heavier, more opinionated                                       |
| From scratch   | Takes days, best reserved for after learning the ecosystem               |

**Key reasons:**

- Built-in LSP with mason.nvim — auto-installs language servers
- Treesitter — precise syntax highlighting, folding, text objects
- snacks.picker — fuzzy find files, grep, LSP symbols (replaces telescope)
- which-key.nvim — shows available keybinds as you type (self-documenting)
- Claude Code integration via `coder/claudecode.nvim`

### 6. Git TUI: lazygit

**Why lazygit over alternatives:**

| Considered | Verdict                                                             |
| ---------- | ------------------------------------------------------------------- |
| lazygit    | **Winner** — best UI polish, intuitive keybinds, Neovim integration |
| GitUI      | Faster on huge repos (Rust) but less polished UI                    |
| tig        | Good browser but limited interactive operations                     |

**Key reasons:**

- Visual staging, committing, rebasing, cherry-picking
- Integrates as a floating window in Neovim
- Intuitive enough to replace most `git` CLI commands
- Active development, large community

### 7. File Manager: yazi

**Why yazi over alternatives:**

| Considered | Verdict                                                           |
| ---------- | ----------------------------------------------------------------- |
| yazi       | **Winner** — fastest (Rust, async I/O), built-in previews, modern |
| ranger     | Feature-complete but slow (Python), blocking I/O                  |
| lf         | Fast (Go) but requires scripting for basic features               |
| nnn        | Lightest weight but no inline previews, plugin-heavy              |

**Key reasons:**

- Async I/O — never blocks on large directories
- Built-in previews for text, images, video, archives
- Fuzzy search, multi-tab, bulk operations out of the box
- Vi-style keybindings

---

## CLI Power Tools

Modern replacements for classic Unix tools. All written in Rust/Go for speed.

| Classic | Replacement        | Why                                                       |
| ------- | ------------------ | --------------------------------------------------------- |
| `ls`    | **eza**            | Icons, git status, tree view, color-coded                 |
| `cat`   | **bat**            | Syntax highlighting, line numbers, git integration        |
| `grep`  | **ripgrep** (`rg`) | 10-100x faster, respects `.gitignore`                     |
| `find`  | **fd**             | Simpler syntax, faster, respects `.gitignore`             |
| `cd`    | **zoxide** (`z`)   | Learns your directories, fuzzy matching                   |
| `top`   | **btop**           | Beautiful resource monitor with graphs                    |
| `diff`  | **delta**          | Syntax-highlighted git diffs, side-by-side view           |
| `sed`   | **sd**             | Simpler find-and-replace syntax                           |
| `man`   | **tldr**           | Community-maintained command examples                     |
| —       | **fzf**            | Fuzzy finder for files, history, git branches, everything |
| —       | **jq**             | JSON processor for API responses and config files         |

---

## Aesthetics

### Font: JetBrains Mono Nerd Font

- Optimized letter forms for code (tall x-height, distinct `0/O`, `1/l/I`)
- Built-in ligatures (`!=`, `=>`, `->`, `===`)
- Nerd Font variant adds 9,000+ icons for status lines, file managers, prompts
- Already installed on this system

### Theme: Catppuccin Mocha

- Soothing pastel palette — easy on the eyes for long sessions
- Most complete theme ecosystem — consistent across Ghostty, Neovim, tmux, lazygit, bat, fzf, btop, delta, and more
- Four flavors available (Latte/light, Frappe, Macchiato, Mocha/darkest)

---

## Architecture

```
┌─────────────────────────────────────────────────┐
│  Ghostty (GPU-accelerated terminal)             │
│  ┌───────────────────────────────────────────┐  │
│  │  tmux (session persistence + layouts)     │  │
│  │  ┌──────────────────┬────────────────────┐│  │
│  │  │  Neovim/LazyVim  │  Claude Code CLI   ││  │
│  │  │  (editor + LSP)  │  (AI assistant)    ││  │
│  │  │                  │                    ││  │
│  │  ├──────────────────┴────────────────────┤│  │
│  │  │  lazygit / tests / logs / yazi        ││  │
│  │  └───────────────────────────────────────┘│  │
│  └───────────────────────────────────────────┘  │
│  Zsh + Starship + autosuggestions               │
│  Font: JetBrains Mono NF | Theme: Catppuccin    │
└─────────────────────────────────────────────────┘
```

## Workflow

1. Open Ghostty → tmux session auto-attaches (or creates new)
2. Neovim in the main pane for editing
3. Claude Code CLI in a side pane for AI-assisted development
4. `lazygit` in a popup for git operations
5. `yazi` for quick file navigation
6. `fzf` + `zoxide` for jumping between projects
7. `Ctrl+b d` to detach — everything persists, reattach anytime

---

## Support Stack

### Zsh Plugins

| Plugin                      | Purpose                                                       |
| --------------------------- | ------------------------------------------------------------- |
| **zsh-autosuggestions**     | Fish-like inline suggestions from history — accept with `→`   |
| **zsh-syntax-highlighting** | Colors commands as you type — green = valid, red = typo       |
| **fzf-tab**                 | Replaces Zsh's default tab completion with fzf fuzzy matching |

These three plugins transform Zsh into a Fish-like experience while keeping POSIX compatibility.

### tmux Plugin Manager (TPM) & Plugins

| Plugin                | Purpose                                                  |
| --------------------- | -------------------------------------------------------- |
| **tpm**               | tmux plugin manager — install plugins with `prefix + I`  |
| **tmux-sensible**     | Universal sensible defaults (UTF-8, history, key repeat) |
| **tmux-catppuccin**   | Catppuccin theme for tmux status bar                     |
| **tmux-resurrect**    | Save and restore tmux sessions across reboots            |
| **tmux-continuum**    | Auto-saves sessions every 15 minutes via resurrect       |
| **tmux-yank**         | Copy to system clipboard from tmux                       |
| **tmux-pain-control** | Intuitive pane navigation and resizing keybinds          |

### Neovim / LazyVim Core Plugins

LazyVim bundles a curated set. Key ones to know:

**Editor Core:**

| Plugin              | Purpose                                                                                  |
| ------------------- | ---------------------------------------------------------------------------------------- |
| **lazy.nvim**       | Plugin manager — lazy-loads for fast startup                                             |
| **nvim-treesitter** | Syntax highlighting, folding, text objects via AST parsing                               |
| **nvim-lspconfig**  | LSP client configuration for go-to-definition, diagnostics, etc.                         |
| **mason.nvim**      | Auto-install LSP servers, formatters, linters (use `"williamboman/mason.nvim"` in specs) |
| **conform.nvim**    | Formatting engine (prettier, stylua, etc.)                                               |
| **nvim-lint**       | Async linting (eslint, etc.)                                                             |
| **blink.cmp**       | Autocompletion engine with LSP, snippet, path sources (replaces nvim-cmp)                |

**Navigation & Search:**

| Plugin              | Purpose                                                                      |
| ------------------- | ---------------------------------------------------------------------------- |
| **snacks.picker**   | Fuzzy finder for files, grep, LSP symbols, buffers (replaces telescope.nvim) |
| **snacks.explorer** | File explorer sidebar (replaces neo-tree.nvim)                               |
| **flash.nvim**      | Jump anywhere on screen with 2-3 keystrokes                                  |
| **which-key.nvim**  | Shows available keybinds as you type — self-documenting                      |
| **harpoon**         | Bookmark and quickly switch between 3-4 working files                        |

**Git Integration:**

| Plugin            | Purpose                                                |
| ----------------- | ------------------------------------------------------ |
| **gitsigns.nvim** | Git decorations in the gutter (added/modified/deleted) |
| **lazygit.nvim**  | Open lazygit in a floating Neovim window               |
| **diffview.nvim** | Side-by-side diff viewer and merge conflict resolver   |

**UI & Experience:**

| Plugin                    | Purpose                                                                      |
| ------------------------- | ---------------------------------------------------------------------------- |
| **lualine.nvim**          | Status line with git, diagnostics, file info                                 |
| **bufferline.nvim**       | Tab-like buffer navigation                                                   |
| **noice.nvim**            | Replaces cmdline, messages, and popupmenu with modern UI                     |
| **snacks.nvim**           | Collection of UI utilities (dashboard, notifier, input, scroll, image, etc.) |
| **indent-blankline.nvim** | Indentation guides                                                           |
| **catppuccin/nvim**       | Catppuccin colorscheme with Treesitter + LSP support                         |
| **mini.pairs**            | Auto-close brackets, quotes, etc.                                            |
| **mini.icons**            | File/folder icons                                                            |
| **todo-comments.nvim**    | Highlight and search TODO/FIXME/HACK comments                                |

**AI Integration:**

| Plugin                    | Purpose                                            |
| ------------------------- | -------------------------------------------------- |
| **coder/claudecode.nvim** | Claude Code integration via WebSocket MCP protocol |

### Git Configuration Enhancements

| Tool/Config           | Purpose                                                   |
| --------------------- | --------------------------------------------------------- |
| **delta**             | Syntax-highlighted diffs, side-by-side mode, line numbers |
| **git-delta themes**  | Catppuccin theme for consistent diff styling              |
| **delta interactive** | Navigate diffs with `n`/`N`, search with `/`              |

Git config additions for delta:

```gitconfig
[core]
    pager = delta
[interactive]
    diffFilter = delta --color-only
[delta]
    navigate = true
    side-by-side = true
    line-numbers = true
    syntax-theme = Catppuccin Mocha
[merge]
    conflictstyle = zdiff3
```

### Shell Aliases & Functions

```bash
# Modern CLI replacements
alias ls="eza --icons"
alias ll="eza -la --icons --git"
alias lt="eza --tree --icons --level=2"
alias cat="bat"
alias grep="rg"
alias find="fd"
alias top="btop"
alias diff="delta"
alias cd="z"                    # zoxide

# Git shortcuts
alias g="git"
alias gs="git status"
alias lg="lazygit"

# Quick navigation
alias ..="cd .."
alias ...="cd ../.."

# fzf + ripgrep for interactive searching
alias rgf='rg --files | fzf --preview "bat --color=always {}"'
```

Custom shell functions:

| Function   | Purpose                                                           |
| ---------- | ----------------------------------------------------------------- |
| `vf`       | Fuzzy find file and open in Neovim (fd + fzf + bat preview)       |
| `cdf`      | Fuzzy find directory and cd into it (with tree preview)           |
| `gbf`      | Fuzzy git branch switcher                                         |
| `fkill`    | Fuzzy process killer                                              |
| `t [name]` | Quick tmux session attach/create (`t` = main, `t kraken` = named) |

### fzf Integration

| Integration       | Purpose                                        |
| ----------------- | ---------------------------------------------- |
| **Ctrl+R**        | Fuzzy search shell history                     |
| **Ctrl+T**        | Fuzzy find files and insert path               |
| **Alt+C**         | Fuzzy find directories and cd into them        |
| **fzf-tab**       | Replace Zsh tab completion with fuzzy matching |
| **fzf + ripgrep** | Interactive grep with live preview             |
| **fzf + git**     | Fuzzy switch branches, view logs, stage files  |

### zoxide Integration

| Command     | Purpose                                                  |
| ----------- | -------------------------------------------------------- |
| `z foo`     | Jump to most frequently visited directory matching "foo" |
| `z foo bar` | Jump to directory matching both "foo" and "bar"          |
| `zi foo`    | Interactive selection with fzf when multiple matches     |
| Auto-learns | Every `cd` teaches zoxide your habits                    |

---

## Config Files Map

All configuration lives in standard XDG locations:

```
~/.config/
├── ghostty/
│   └── config              # Terminal settings, font, theme, keybinds
├── nvim/
│   └── lua/                # LazyVim config + custom overrides
│       ├── config/
│       │   ├── lazy.lua    # Plugin manager bootstrap
│       │   ├── keymaps.lua # Custom key mappings
│       │   └── options.lua # Neovim options
│       └── plugins/
│           └── *.lua       # Per-plugin configuration
├── tmux/
│   └── tmux.conf           # tmux settings, keybinds, plugins
├── yazi/
│   └── yazi.toml           # File manager settings
├── lazygit/
│   └── config.yml          # lazygit settings, keybinds
├── bat/
│   └── config              # bat theme and settings
├── starship.toml           # Prompt configuration
└── delta/                  # (uses gitconfig, no separate dir)

~/.zshrc                    # Shell config, aliases, plugin loading
~/.gitconfig                # Git settings, delta integration
```

---

## Install

All tools installed via Homebrew:

```bash
# Core stack
brew install ghostty neovim tmux lazygit yazi starship

# CLI power tools
brew install fzf ripgrep eza bat fd zoxide git-delta btop tldr sd jq

# Language tools
brew install golangci-lint

# Zsh plugins
brew install zsh-autosuggestions zsh-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab ~/.config/fzf-tab

# tmux plugin manager (then press prefix + I inside tmux to install plugins)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# LazyVim (Neovim distribution)
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Claude Code Neovim integration
# Added as a LazyVim extra plugin in ~/.config/nvim/lua/plugins/claudecode.lua
```

### Post-Install Steps

1. Open `tmux` and press `Ctrl+b` then `I` (capital I) to install TPM plugins
2. Open `nvim` — Lazy will auto-install all plugins on first launch
3. In Neovim, Mason auto-installs LSP servers (gopls, vtsls, etc.)
4. Run `~/.tmux/plugins/tpm/bin/install_plugins` if `Ctrl+b I` doesn't work

### Troubleshooting

| Issue                       | Fix                                                                       |
| --------------------------- | ------------------------------------------------------------------------- |
| Ghostty theme not found     | Theme name is `Catppuccin Mocha` (with space, capital C and M)            |
| mason.nvim config error     | Use `"williamboman/mason.nvim"` in plugin specs (LazyVim's internal name) |
| golangci-lint exit code 3   | `brew install golangci-lint`                                              |
| Neovim provider warnings    | Safe to ignore — LazyVim doesn't use python/ruby/perl providers           |
| tmux plugins not installing | Run `~/.tmux/plugins/tpm/bin/install_plugins` directly                    |

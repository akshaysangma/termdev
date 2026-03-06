# Manual Steps

Steps that require user interaction and can't be fully automated.

---

## Prerequisites

Before running `setup.sh`, ensure you have:

- **macOS on Apple Silicon** (the script uses `/opt/homebrew` paths)
- **Homebrew** installed — https://brew.sh
- **JetBrains Mono Nerd Font** installed:
  ```bash
  brew install --cask font-jetbrains-mono-nerd-font
  ```

---

## Run the Setup Script

```bash
chmod +x setup.sh
./setup.sh
```

---

## Post-Script Manual Steps

### 1. Ghostty Accessibility Permissions

The quick terminal keybind (`Cmd+backtick`) requires Accessibility access:

1. Open **Ghostty** — it will prompt for permissions
2. Go to **System Settings → Privacy & Security → Accessibility**
3. Enable **Ghostty** in the list

### 2. First Neovim Launch

LazyVim auto-installs all plugins on first run:

```bash
nvim
```

Wait for the installation to complete (you'll see progress in the bottom bar), then quit with `:q`.

### 3. tmux Plugin Install (if script couldn't do it)

If the script reported TPM wasn't found, start tmux and install manually:

1. Open tmux: `tmux`
2. Press **`Ctrl+b`** then **`Shift+I`** (capital I)
3. Wait for plugins to install (status bar will show progress)

---

## Verification Checklist

Open a **new terminal window** (or `source ~/.zshrc`) and verify each component:

| Check           | Command                    | Expected                                  |
| --------------- | -------------------------- | ----------------------------------------- |
| Starship prompt | Open new terminal          | Prompt shows `❯` with catppuccin colors   |
| tmux theme      | `tmux`                     | Catppuccin Mocha status bar at bottom     |
| Neovim          | `nvim`                     | LazyVim dashboard loads with all plugins  |
| bat theme       | `bat ~/.zshrc`             | Syntax highlighting with Catppuccin Mocha |
| delta diffs     | `git log -p` (in any repo) | Side-by-side syntax-highlighted diffs     |
| eza aliases     | `ls` / `ll` / `lt`         | File listing with icons and colors        |
| zoxide          | `z` + directory name       | Jumps to matching directory               |
| fzf history     | `Ctrl+R`                   | Fuzzy search through shell history        |
| fzf files       | `Ctrl+T`                   | Fuzzy file picker with bat preview        |
| lazygit         | `lg`                       | lazygit TUI with Catppuccin theme         |
| yazi            | `yazi`                     | File manager with previews                |
| btop            | `top` (aliased)            | Resource monitor with graphs              |

---

## Keybinds Reference

### Ghostty

| Keybind        | Action                            |
| -------------- | --------------------------------- |
| `Cmd+backtick` | Toggle quick terminal (drop-down) |
| `Cmd+Shift+,`  | Hot-reload config                 |
| `Cmd+D`        | Split right                       |
| `Cmd+Shift+D`  | Split down                        |

### tmux (prefix: `Ctrl+b`)

| Keybind          | Action                          |
| ---------------- | ------------------------------- |
| `Ctrl+b c`       | New window                      |
| `Ctrl+b ,`       | Rename window                   |
| `Ctrl+b n` / `p` | Next / previous window          |
| `Ctrl+b \|`      | Split vertical (pain-control)   |
| `Ctrl+b -`       | Split horizontal (pain-control) |
| `Ctrl+b h/j/k/l` | Navigate panes (pain-control)   |
| `Ctrl+b d`       | Detach session                  |
| `Ctrl+b I`       | Install TPM plugins             |
| `Ctrl+b [`       | Enter copy mode (vi keys)       |

### Neovim / LazyVim

| Keybind     | Action                            |
| ----------- | --------------------------------- |
| `Space`     | Leader key — shows which-key menu |
| `Space f f` | Find files (snacks.picker)        |
| `Space f g` | Live grep (snacks.picker)         |
| `Space e`   | File explorer (snacks.explorer)   |
| `Space g g` | Open lazygit                      |
| `Space l`   | Lazy plugin manager               |
| `s`         | Flash jump                        |
| `gcc`       | Toggle line comment               |

---

## Troubleshooting

### Prompt looks broken / no icons

- Ensure JetBrains Mono **Nerd Font** is installed (not regular JetBrains Mono)
- In Ghostty config, verify: `font-family = JetBrainsMono Nerd Font`

### Colors look wrong in tmux

- Ensure Ghostty reports itself as `xterm-256color`:
  ```bash
  echo $TERM  # should be xterm-256color outside tmux
  ```
- Inside tmux it should be `tmux-256color`

### fzf Ctrl+T / Alt+C not working

- `Alt+C` requires Ghostty to pass Option as Alt. Add to ghostty config:
  ```
  macos-option-as-alt = true
  ```

### zsh-syntax-highlighting not loading

- Check the file exists:
  ```bash
  ls /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ```

### bat theme "not found"

- Rebuild the cache:
  ```bash
  bat cache --build
  ```

### Ghostty: theme "catppuccin-mocha" not found

- The theme name requires exact casing with a space: `Catppuccin Mocha`
- Verify available themes: `ls /Applications/Ghostty.app/Contents/Resources/ghostty/themes/ | grep -i catppuccin`

### Neovim: "Failed to run config for mason.nvim"

- LazyVim uses `"williamboman/mason.nvim"` as the internal plugin spec name
- In your custom plugin files, always use `"williamboman/mason.nvim"` (not `"mason-org/mason.nvim"`)
- Even though the repo was renamed upstream, LazyVim hasn't updated its internal reference

### Neovim: golangci-lint exited with code 3

- Install it: `brew install golangci-lint`

### Neovim: provider warnings (python/ruby/perl/node)

- These are safe to ignore — LazyVim doesn't use legacy remote plugin providers
- To silence them, add to `~/.config/nvim/lua/config/options.lua`:
  ```lua
  vim.g.loaded_python3_provider = 0
  vim.g.loaded_ruby_provider = 0
  vim.g.loaded_perl_provider = 0
  vim.g.loaded_node_provider = 0
  ```

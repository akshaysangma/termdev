# Terminal Development Guide

Practical usage guide for the terminal development stack. Shortcuts, workflows, and tips.

---

## Table of Contents

1. [Ghostty](#1-ghostty)
2. [tmux](#2-tmux)
3. [Neovim / LazyVim](#3-neovim--lazyvim)
4. [Shell (Zsh + Tools)](#4-shell-zsh--tools)
5. [lazygit](#5-lazygit)
6. [yazi](#6-yazi)
7. [Claude Code CLI](#7-claude-code-cli)
8. [Claude Code + Neovim](#8-claude-code--neovim)
9. [Claude Code + tmux (Agent Teams)](#9-claude-code--tmux-agent-teams)
10. [Daily Workflows](#10-daily-workflows)
11. [CLI Power Tools Cheatsheet](#11-cli-power-tools-cheatsheet)

---

## 1. Ghostty

### Shortcuts

| Action                     | Shortcut                          |
| -------------------------- | --------------------------------- |
| Quick Terminal (drop-down) | ` Cmd+``  ` (backtick)            |
| New tab                    | `Cmd+T`                           |
| Close tab                  | `Cmd+W`                           |
| Next tab                   | `Cmd+Shift+]` or `Ctrl+Tab`       |
| Previous tab               | `Cmd+Shift+[` or `Ctrl+Shift+Tab` |
| Split right                | `Cmd+D`                           |
| Split down                 | `Cmd+Shift+D`                     |
| Navigate splits            | `Cmd+Alt+Arrow`                   |
| Close split                | `Cmd+W`                           |
| Zoom split (toggle)        | `Cmd+Shift+Enter`                 |
| Increase font size         | `Cmd++`                           |
| Decrease font size         | `Cmd+-`                           |
| Reset font size            | `Cmd+0`                           |
| Reload config              | `Cmd+Shift+,`                     |
| Open config                | Edit `~/.config/ghostty/config`   |
| Toggle fullscreen          | `Cmd+Ctrl+F`                      |
| Search in terminal         | `Cmd+F`                           |

### Tips

- **Quick Terminal** is the killer feature — ` Cmd+``  ` drops a terminal from the top of screen. Press again to dismiss. Use it for quick commands without leaving your current app.
- **Ghostty splits vs tmux splits**: Use Ghostty splits for quick throwaway panes. Use tmux splits for persistent sessions that survive disconnects.
- Config changes hot-reload — no need to restart Ghostty.

---

## 2. tmux

Prefix key is `Ctrl+b` (referred to as `<prefix>` below).

### Session Management

| Action            | Shortcut                        |
| ----------------- | ------------------------------- |
| New session       | `tmux new -s name`              |
| List sessions     | `tmux ls` or `<prefix> s`       |
| Attach to session | `tmux attach -t name`           |
| Detach            | `<prefix> d`                    |
| Kill session      | `tmux kill-session -t name`     |
| Rename session    | `<prefix> $`                    |
| Switch session    | `<prefix> s` (interactive list) |
| Next session      | `<prefix> )`                    |
| Previous session  | `<prefix> (`                    |

### Windows (tabs)

| Action          | Shortcut                   |
| --------------- | -------------------------- |
| New window      | `<prefix> c`               |
| Next window     | `<prefix> n`               |
| Previous window | `<prefix> p`               |
| Go to window N  | `<prefix> 1-9`             |
| Rename window   | `<prefix> ,`               |
| Close window    | `<prefix> &`               |
| List windows    | `<prefix> w` (interactive) |

### Panes (splits)

| Action                 | Shortcut                                            |
| ---------------------- | --------------------------------------------------- |
| Split horizontal       | `<prefix> -` (pain-control)                         |
| Split vertical         | `<prefix> \|` (pain-control)                        |
| Navigate panes         | `<prefix> h/j/k/l` (pain-control, vi-style)         |
| Resize pane            | `<prefix> H/J/K/L` (pain-control, capital = resize) |
| Zoom pane (toggle)     | `<prefix> z`                                        |
| Close pane             | `<prefix> x`                                        |
| Swap pane up           | `<prefix> {`                                        |
| Swap pane down         | `<prefix> }`                                        |
| Rotate panes           | `<prefix> Ctrl+o`                                   |
| Show pane numbers      | `<prefix> q`                                        |
| Convert pane to window | `<prefix> !`                                        |

### Copy Mode (vi-style)

| Action          | Shortcut                                                     |
| --------------- | ------------------------------------------------------------ |
| Enter copy mode | `<prefix> [`                                                 |
| Start selection | `v` (in copy mode)                                           |
| Copy selection  | `y` (in copy mode, copies to system clipboard via tmux-yank) |
| Paste           | `<prefix> ]`                                                 |
| Search forward  | `/` (in copy mode)                                           |
| Search backward | `?` (in copy mode)                                           |
| Scroll up       | `Ctrl+u` (in copy mode)                                      |
| Scroll down     | `Ctrl+d` (in copy mode)                                      |
| Exit copy mode  | `q` or `Escape`                                              |

### Plugin Commands

| Action                      | Shortcut                 |
| --------------------------- | ------------------------ |
| Install plugins             | `<prefix> I` (capital I) |
| Update plugins              | `<prefix> U` (capital U) |
| Save session (resurrect)    | `<prefix> Ctrl+s`        |
| Restore session (resurrect) | `<prefix> Ctrl+r`        |

### Custom Shortcuts (added to our config)

| Action                | Shortcut          |
| --------------------- | ----------------- |
| Reload tmux config    | `<prefix> r`      |
| fzf session switcher  | `<prefix> Ctrl+f` |
| fzf window switcher   | `<prefix> Ctrl+w` |
| lazygit popup         | `<prefix> g`      |
| yazi popup            | `<prefix> y`      |
| Join pane from window | `<prefix> j`      |

New splits/windows now open in the **current directory** (not home).

### Tips

- **Session per project**: `tmux new -s kraken` for kraken, `tmux new -s prisma` for prisma. Switch with `<prefix> s`.
- **Detach, don't close**: `<prefix> d` to detach. Your session persists. `tmux attach -t name` to return.
- **Zoom pane**: `<prefix> z` to fullscreen a pane, press again to restore. Great for temporarily maximizing Neovim or Claude Code.
- **Mouse is enabled**: Click to focus panes, scroll to see history, drag to resize panes.
- **Sessions auto-save** every 15 minutes (tmux-continuum). After a reboot, `tmux` auto-restores your last session.

---

## 3. Neovim / LazyVim

Leader key is `Space`. Referred to as `<leader>` below.

### Essential: First Steps

| Action                  | Shortcut                                       |
| ----------------------- | ---------------------------------------------- |
| Open file explorer      | `<leader> e`                                   |
| Find files              | `<leader> <leader>` or `<leader> ff`           |
| Live grep (search text) | `<leader> /` or `<leader> sg`                  |
| Command palette         | `:`                                            |
| Show all keybinds       | `<leader>` then wait (which-key shows options) |
| Quit                    | `:q` or `<leader> qq`                          |
| Save                    | `Ctrl+s` (works in insert mode too)            |
| Save all and quit       | `:wqa`                                         |

### Navigation

| Action                | Shortcut              |
| --------------------- | --------------------- |
| Move between splits   | `Ctrl+h/j/k/l`        |
| Next buffer (tab)     | `<S-l>` (Shift+L)     |
| Previous buffer (tab) | `<S-h>` (Shift+H)     |
| Close buffer          | `<leader> bd`         |
| Close other buffers   | `<leader> bo`         |
| Go to definition      | `gd`                  |
| Go to references      | `gr`                  |
| Go to implementation  | `gI`                  |
| Go to type definition | `gy`                  |
| Go back               | `Ctrl+o`              |
| Go forward            | `Ctrl+i`              |
| Jump anywhere (flash) | `s` then type 2 chars |
| File explorer toggle  | `<leader> e`          |

### Search & Find

| Action                        | Shortcut      |
| ----------------------------- | ------------- |
| Find files                    | `<leader> ff` |
| Find in open buffers          | `<leader> fb` |
| Find recent files             | `<leader> fr` |
| Grep (search text)            | `<leader> sg` |
| Grep word under cursor        | `<leader> sw` |
| Search symbols (current file) | `<leader> ss` |
| Search symbols (workspace)    | `<leader> sS` |
| Search TODOs                  | `<leader> st` |
| Search keymaps                | `<leader> sk` |
| Search help                   | `<leader> sh` |
| Search commands               | `<leader> sc` |
| Resume last search            | `<leader> sR` |

### Code Actions (LSP)

| Action                     | Shortcut      |
| -------------------------- | ------------- |
| Hover documentation        | `K`           |
| Signature help             | `gK`          |
| Code action                | `<leader> ca` |
| Rename symbol              | `<leader> cr` |
| Format file                | `<leader> cf` |
| Organize imports (TS)      | `<leader> co` |
| Add missing imports (TS)   | `<leader> cM` |
| Remove unused imports (TS) | `<leader> cu` |
| Diagnostics (file)         | `<leader> xx` |
| Next diagnostic            | `]d`          |
| Previous diagnostic        | `[d`          |
| Next error                 | `]e`          |
| Previous error             | `[e`          |
| LSP info                   | `<leader> cl` |
| LSP restart                | `:LspRestart` |

### Git (in Neovim)

| Action         | Shortcut       |
| -------------- | -------------- |
| Open lazygit   | `<leader> gg`  |
| Git blame line | `<leader> gb`  |
| Diff this file | `<leader> gd`  |
| Next hunk      | `]h`           |
| Previous hunk  | `[h`           |
| Stage hunk     | `<leader> ghs` |
| Reset hunk     | `<leader> ghr` |
| Preview hunk   | `<leader> ghp` |

### Window Management

| Action           | Shortcut      |
| ---------------- | ------------- |
| Split horizontal | `<leader> -`  |
| Split vertical   | `<leader> \|` |
| Close split      | `<leader> wd` |
| Equal splits     | `<leader> w=` |
| Maximize split   | `<leader> wm` |

### Editing

| Action                    | Shortcut                          |
| ------------------------- | --------------------------------- |
| Comment line              | `gcc`                             |
| Comment selection         | `gc` (visual mode)                |
| Indent (stay in visual)   | `>` (visual mode, stays selected) |
| Unindent (stay in visual) | `<` (visual mode, stays selected) |
| Move line down            | `Alt+j`                           |
| Move line up              | `Alt+k`                           |
| Duplicate line            | `yyp`                             |
| Delete line               | `dd`                              |
| Undo                      | `u`                               |
| Redo                      | `Ctrl+r`                          |
| Select all                | `Ctrl+a`                          |

### Custom Keymaps (added to our config)

| Action                     | Shortcut                             |
| -------------------------- | ------------------------------------ |
| Exit insert mode           | `jk`                                 |
| Scroll down (centered)     | `Ctrl+d` (cursor stays centered)     |
| Scroll up (centered)       | `Ctrl+u` (cursor stays centered)     |
| Next search (centered)     | `n` (cursor stays centered)          |
| Prev search (centered)     | `N` (cursor stays centered)          |
| Paste over (keep register) | `<leader>p` (in visual mode)         |
| Delete to void             | `<leader>d` (delete without yanking) |
| Start of line              | `H` (easier than `^`)                |
| End of line                | `L` (easier than `$`)                |
| Close buffer               | `<leader>x`                          |
| Open terminal              | `<leader>tt`                         |
| Save file                  | `Ctrl+s` (works in all modes)        |

### Custom Options

- **Relative line numbers** — shows distance for easy `5j`, `12k` jumps
- **8-line scroll margin** — cursor never gets stuck at screen edge
- **Smart case search** — lowercase = case-insensitive, any capital = case-sensitive
- **200ms update time** — faster diagnostics and gitsigns
- **Splits open right/below** — more natural split behavior

### Plugin Management

| Action                     | Shortcut       |
| -------------------------- | -------------- |
| Open Lazy (plugin manager) | `<leader> l`   |
| Mason (LSP manager)        | `:Mason`       |
| Check health               | `:checkhealth` |
| View messages              | `:messages`    |

### Tips

- **which-key is your friend**: Press `<leader>` and wait 300ms — a popup shows ALL available keybinds organized by category.
- **Flash jump**: Press `s`, type 2 characters of where you want to go, then press the highlight label. Fastest way to navigate.
- **`:` is powerful**: `:e filename` to open, `:vs filename` for vertical split, `:sp filename` for horizontal split.
- **Repeat with `.`**: The `.` key repeats your last change. Edit once, repeat everywhere.
- **Text objects**: `ci"` = change inside quotes, `da(` = delete around parens, `vi{` = select inside braces. Learn `i` (inside) and `a` (around).
- **Surround**: `ysiw"` = surround word with quotes, `cs"'` = change surrounding " to ', `ds"` = delete surrounding quotes.
- **Macros**: `qa` to start recording macro to register `a`, do your edits, `q` to stop. `@a` to replay, `10@a` to replay 10 times.

---

## 4. Shell (Zsh + Tools)

### Autosuggestions

| Action             | Shortcut          |
| ------------------ | ----------------- |
| Accept suggestion  | `→` (right arrow) |
| Accept next word   | `Ctrl+→`          |
| Dismiss suggestion | `Escape`          |

Suggestions come from your command history. The more you use the terminal, the smarter they get.

### Syntax Highlighting

- **Green** = valid command
- **Red** = command not found / typo
- **Underline** = valid file path
- Works as you type — catch typos before hitting Enter.

### fzf (Fuzzy Finder)

| Action                     | Shortcut                      |
| -------------------------- | ----------------------------- |
| Search command history     | `Ctrl+R`                      |
| Find files, insert path    | `Ctrl+T`                      |
| Find directory, cd into it | `Alt+C` (or `Esc+C` on macOS) |
| Tab completion (fzf-tab)   | `Tab`                         |

In any fzf list:
| Action | Shortcut |
|---|---|
| Move down | `Ctrl+j` or `↓` |
| Move up | `Ctrl+k` or `↑` |
| Select multiple | `Tab` |
| Confirm | `Enter` |
| Cancel | `Escape` |
| Preview scroll down | `Ctrl+d` |
| Preview scroll up | `Ctrl+u` |

### zoxide (Smart cd)

```bash
z kraken          # Jump to most-visited dir matching "kraken"
z prisma          # Jump to prisma directory
z kr pl           # Jump to dir matching both "kr" and "pl"
zi                # Interactive: fzf picker of all known directories
```

zoxide learns every directory you visit. After a few days, `z` + a few chars gets you anywhere instantly.

### Modern CLI Tool Usage

```bash
# eza (ls replacement)
ls                # List with icons (aliased)
ll                # Long list with git status
lt                # Tree view (2 levels deep)
eza -la --git     # Full list with git info
eza --tree -L 3   # Tree view, 3 levels

# bat (cat replacement)
cat file.go       # Syntax highlighted (aliased)
bat -p file.go    # Plain mode (no decorations)
bat -l json       # Force language detection
bat --diff file   # Show git diff for file

# ripgrep (grep replacement)
rg "pattern"               # Search current dir recursively
rg "pattern" src/          # Search in src/
rg -i "pattern"            # Case-insensitive
rg -w "exact"              # Whole word match
rg -t go "func"            # Only in .go files
rg -g "*.ts" "import"      # Only in .ts files
rg -C 3 "error"            # Show 3 lines of context
rg --json "pattern" | jq   # Machine-readable output

# fd (find replacement)
fd "pattern"               # Find files matching pattern
fd -e go                   # Find all .go files
fd -e ts src/              # Find .ts files in src/
fd -t d "test"             # Find directories matching "test"
fd -H ".env"               # Include hidden files
fd -x rm {}                # Find and delete (careful!)

# sd (sed replacement)
sd "old" "new" file.txt         # Replace in file
sd "old" "new" **/*.go          # Replace in all .go files
sd 'func (\w+)' 'fn $1' f.go   # Regex with capture groups

# delta (diff)
git diff                   # Automatic — delta is git's pager
git diff --side-by-side    # Already default in our config
git log -p                 # Patches with syntax highlighting

# btop (top replacement)
top                        # Opens btop (aliased)
btop                       # Resource monitor with graphs

# jq (JSON processor)
curl api/endpoint | jq '.'           # Pretty print JSON
cat data.json | jq '.items[]'       # Extract array items
cat data.json | jq '.name, .id'     # Extract specific fields
cat data.json | jq 'select(.age>30)' # Filter objects

# tldr (man replacement)
tldr tar            # Quick examples for tar
tldr git-rebase     # Quick examples for git rebase
```

### Custom Shell Functions

```bash
vf                # Fuzzy find files, open in Neovim
cdf               # Fuzzy find directories, cd into it (with tree preview)
gbf               # Fuzzy git branch switcher
fkill             # Fuzzy process killer
t                 # Quick tmux: `t` = attach/create main, `t name` = attach/create named session
rgf               # Fuzzy find files with bat preview
```

**`vf`** is the most useful — it combines fd + fzf + bat preview + Neovim. One command to find and open any file.

**`t`** simplifies tmux sessions:

```bash
t               # Attach to existing session, or create "main"
t kraken        # Attach to "kraken" session, or create it
t prisma        # Attach to "prisma" session, or create it
```

---

## 5. lazygit

Open with `lg` in terminal or `<leader> gg` in Neovim.

### Panels

Navigate between panels with `Tab` or numbers `1-5`:

1. **Status** — current branch, repo info
2. **Files** — staged/unstaged changes
3. **Branches** — local and remote branches
4. **Commits** — commit history
5. **Stash** — stashed changes

### Key Shortcuts

| Action             | Shortcut                            |
| ------------------ | ----------------------------------- |
| Switch panels      | `Tab` or `h/l`                      |
| Navigate items     | `j/k`                               |
| Stage/unstage file | `Space`                             |
| Stage all          | `a`                                 |
| Commit             | `c`                                 |
| Commit with editor | `C`                                 |
| Amend commit       | `A`                                 |
| Push               | `P` (capital)                       |
| Pull               | `p`                                 |
| New branch         | `n` (in branches panel)             |
| Checkout branch    | `Space` (in branches panel)         |
| Merge branch       | `M` (in branches panel)             |
| Rebase onto branch | `r` (in branches panel)             |
| Interactive rebase | `e` (on a commit)                   |
| Cherry-pick commit | `C` (in commits, then `V` to paste) |
| View diff          | `Enter` (on file or commit)         |
| Discard changes    | `d` (on file)                       |
| Stash changes      | `s` (in files panel)                |
| Pop stash          | `g` (in stash panel)                |
| Open in editor     | `e` (on file)                       |
| Quit               | `q`                                 |
| Help               | `?`                                 |

### Tips

- **Stage hunks**: Enter a file, use `Space` to stage individual hunks instead of the whole file.
- **Interactive rebase**: Go to commits panel, press `e` on a commit to start interactive rebase. Use `d` to drop, `s` to squash, `f` to fixup, `e` to edit, `p` to pick.
- **Force push**: After amending or rebasing, push with `P`, lazygit will ask if you want to force push.
- **Conflict resolution**: During merge conflicts, lazygit shows both sides and lets you pick one.

---

## 6. yazi

Open with `yazi` in terminal.

### Navigation

| Action           | Shortcut           |
| ---------------- | ------------------ |
| Move down        | `j`                |
| Move up          | `k`                |
| Enter directory  | `l` or `Enter`     |
| Go back (parent) | `h`                |
| Go to top        | `gg`               |
| Go to bottom     | `G`                |
| Go to home       | `~`                |
| Go to root       | `/` then type path |
| Search files     | `f` (fuzzy find)   |
| Filter files     | `/`                |

### Operations

| Action                | Shortcut                               |
| --------------------- | -------------------------------------- |
| Open file             | `Enter` or `l`                         |
| Open in editor (nvim) | `o`                                    |
| Copy file             | `y` (yank)                             |
| Cut file              | `d`                                    |
| Paste file            | `p`                                    |
| Delete file           | `D`                                    |
| Rename                | `r`                                    |
| Create file           | `a` then type name                     |
| Create directory      | `a` then type `name/` (trailing slash) |
| Toggle hidden files   | `.`                                    |
| Select file           | `Space`                                |
| Select all            | `Ctrl+a`                               |
| Quit                  | `q`                                    |

### Tabs

| Action       | Shortcut    |
| ------------ | ----------- |
| New tab      | `t`         |
| Close tab    | `Ctrl+w`    |
| Next tab     | `Tab`       |
| Previous tab | `Shift+Tab` |

### Tips

- **Preview**: Files are previewed in the right pane automatically — text, images, videos, archives.
- **Shell command**: Press `:` to run a shell command in the current directory.
- **Bulk rename**: Select multiple files, press `r` to bulk rename.
- **Copy path**: Press `Ctrl+c` to copy the current file path.

---

## 7. Claude Code CLI

### Basic Usage

```bash
claude                     # Start interactive session
claude "fix the bug in x"  # Start with a prompt
claude -p "explain this"   # Print mode (no interactive session)
claude --resume            # Resume last conversation
claude --continue          # Continue last conversation
```

### In-Session Commands

| Command    | Purpose                                           |
| ---------- | ------------------------------------------------- |
| `/help`    | Show all commands                                 |
| `/compact` | Compact conversation (save context)               |
| `/clear`   | Clear conversation history                        |
| `/model`   | Switch model                                      |
| `/cost`    | Show token usage and cost                         |
| `/review`  | Review code changes                               |
| `/diff`    | Show current changes                              |
| `/undo`    | Undo last file change                             |
| `Esc Esc`  | Rewind to checkpoint (undoes code + conversation) |

### Optimal Usage Patterns

**Start focused:**

```bash
# Give Claude context about what you're working on
claude "I'm working on the user auth module in src/auth/.
The login flow has a race condition when..."
```

**Use @ to reference files:**

```
@src/auth/login.ts fix the race condition in handleLogin
```

**Use CLAUDE.md for project context:**
Every project should have a `CLAUDE.md` at the root. Claude reads it automatically and uses it for context about the project structure, conventions, and common tasks.

**Headless mode for automation:**

```bash
# Run a task non-interactively
claude -p "add error handling to all API calls in src/api/" --allowedTools Edit,Write,Read

# Pipe output
claude -p "explain this error" < error.log
```

**Multi-turn for complex tasks:**

```
You: refactor the database layer to use connection pooling
Claude: [makes changes]
You: now add tests for the new connection pool
Claude: [adds tests, knows about the changes it just made]
You: run the tests
Claude: [runs tests, fixes any failures]
```

### Tips

- **Checkpoint system**: Claude auto-saves before each change. Press `Esc Esc` to rewind both code AND conversation.
- **Be specific**: "fix the bug" is worse than "the login function in auth.ts returns null instead of throwing when the token is expired".
- **Let Claude read first**: Don't describe code to Claude — let it read the files. "Read src/auth/ and explain the login flow" is better than pasting code.
- **Iterate**: Claude works best in conversation. Start broad, refine with follow-ups.
- **Use `/compact`** when the conversation gets long — it summarizes context to free up the context window.

---

## 8. Claude Code + Neovim

The `claudecode.nvim` plugin connects Neovim to Claude Code via WebSocket.

### Setup

Claude Code must be running in a terminal (tmux pane or Ghostty split) for the Neovim integration to work.

### Features

- **@-mention files** from Neovim: Select text in Neovim and Claude Code can see it.
- **Visual selection context**: Select code in Neovim, Claude Code receives it as context.
- **File watching**: When Claude edits files, Neovim auto-reloads them.

### Workflow

1. Open `nvim` in one tmux pane
2. Open `claude` in an adjacent tmux pane
3. In Claude Code, reference files by path — Neovim and Claude edit the same files
4. Neovim auto-reloads when Claude makes changes
5. Use Neovim's LSP to verify Claude's changes (diagnostics, type errors show instantly)

### Tips

- **LSP as a safety net**: After Claude makes changes, Neovim's LSP immediately shows type errors, missing imports, etc.
- **lazygit for review**: After Claude makes changes, `<leader> gg` opens lazygit to review diffs before committing.
- **Split workflow**: Neovim on the left for code review, Claude Code on the right for generation. You review and approve as Claude works.

---

## 9. Claude Code + tmux (Agent Teams)

Run multiple Claude Code agents simultaneously, each in its own tmux pane.

### Basic Multi-Agent Setup

```bash
# Create a session with 3 panes
tmux new-session -s agents

# Split into panes
# Pane 1: Researcher
<prefix> |    # vertical split
# Pane 2: Implementer
<prefix> -    # horizontal split
# Pane 3: Tester
```

In each pane, start Claude with a specific role:

**Pane 1 — Researcher:**

```bash
claude "You are a researcher. Analyze the codebase in src/ and
document the architecture, key patterns, and potential issues.
Write findings to /tmp/research.md"
```

**Pane 2 — Implementer:**

```bash
claude "You are an implementer. Wait for me to give you tasks.
Read /tmp/research.md for context about the codebase."
```

**Pane 3 — Tester:**

```bash
claude "You are a tester. Monitor changes to src/ and
run the test suite. Report failures."
```

### Tips

- **Watch all agents**: `<prefix> z` to zoom into one pane, `<prefix> z` again to zoom out and see all.
- **Copy between agents**: Use the shared filesystem — one agent writes to a file, another reads it.
- **Session persistence**: Detach with `<prefix> d`, agents keep running. Reattach with `tmux attach -t agents`.

---

## 10. Daily Workflows

### Starting Your Day

```bash
# Open Ghostty (or Cmd+` for Quick Terminal)
# Attach to your project session (auto-restores via continuum)
tmux attach -t myproject

# Or create a new session
tmux new -s myproject
```

### Working on a Feature

```
# Terminal layout: Neovim (left) | Claude Code (right)
# Bottom: tests / logs

# 1. Navigate to project
z myproject

# 2. Open editor
nvim .

# 3. In another pane, start Claude
claude

# 4. In Claude: "read src/feature/ and understand the current implementation"
# 5. In Claude: "add caching to the getUserProfile function"
# 6. In Neovim: review changes (LSP catches errors)
# 7. In Neovim: <leader>gg to open lazygit, stage and commit
```

### Reviewing a PR

```bash
# In terminal
gh pr checkout 123

# Open lazygit to see all changes
lg

# Or in Neovim
nvim .
# <leader>gg for lazygit
# <leader>gd for diff view
```

### Quick Debugging

```bash
# Use Claude Code for quick analysis
claude -p "look at the error in src/api/handler.go:45 and suggest a fix"

# Or interactive
claude
> @src/api/handler.go this returns a 500 error when the user has no profile. fix it.
```

### Searching Across Projects

```bash
# fzf + ripgrep across the whole workspace
rg "functionName" ~/github.com/

# Find a file you can't remember
fd "config" ~/github.com/ --type f

# Jump to a project
z prisma         # takes you to your most-visited prisma dir
z kraken         # takes you to kraken
```

### End of Day

```bash
# tmux auto-saves your session (continuum)
# Just detach or close Ghostty — everything persists
<prefix> d       # detach from tmux

# Or if you want to explicitly save
<prefix> Ctrl+s  # manual save (tmux-resurrect)
```

---

## 11. CLI Power Tools Cheatsheet

### Quick Reference

```bash
# === Files & Navigation ===
ls                    # eza with icons
ll                    # long list with git status
lt                    # tree view
z project             # smart cd
zi                    # interactive cd with fzf
yazi                  # file manager

# === Search ===
Ctrl+R                # fuzzy history search
Ctrl+T                # fuzzy file finder
rg "pattern"          # search file contents
fd "name"             # find files by name
rgf                   # interactive file browser with preview

# === View ===
cat file              # bat with syntax highlighting
top                   # btop resource monitor
tldr command          # quick command reference

# === Git ===
lg                    # lazygit TUI
gs                    # git status
git diff              # delta-formatted diff (automatic)

# === Edit ===
nvim file             # open in Neovim
nvim .                # open project in Neovim
sd "old" "new" file   # find and replace

# === AI ===
claude                # start Claude Code
claude "task"         # start with a task
claude -p "question"  # quick answer (no session)
```

---

## Appendix: Learning Path

If you're new to this stack, learn in this order:

1. **Week 1**: Ghostty basics + shell aliases + `z` + `Ctrl+R`
2. **Week 2**: tmux sessions/panes + Claude Code CLI
3. **Week 3**: Neovim basics (movement, `<leader>` menu, file finding)
4. **Week 4**: Neovim LSP features + lazygit
5. **Ongoing**: Advanced Neovim (macros, text objects, flash), yazi, agent teams

The key is to learn one tool at a time. Don't try to master everything at once. Use `which-key` in Neovim — it shows you what's available as you type.

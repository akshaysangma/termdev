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

## 12. Vim Motions Primer

If you're new to Vim/Neovim, start here. Run `vimtutor` in terminal for an interactive 30-minute tutorial.

### Modes

| Mode        | Enter with         | Purpose                                                   |
| ----------- | ------------------ | --------------------------------------------------------- |
| **Normal**  | `Esc` or `jk`      | Navigate, delete, copy, paste — where you spend most time |
| **Insert**  | `i`, `a`, `o`, `O` | Type text                                                 |
| **Visual**  | `v`, `V`, `Ctrl+v` | Select text                                               |
| **Command** | `:`                | Run commands (`:w`, `:q`, `:s/old/new/g`)                 |

Golden rule: **stay in Normal mode**. Enter Insert only to type, then immediately exit.

### Movement (Normal mode)

```
        k           Line up
    h       l       Character left/right
        j           Line down

    w               Next word start
    b               Previous word start
    e               Next word end

    0               Start of line
    ^  (or H)       First non-blank character
    $  (or L)       End of line

    gg              First line of file
    G               Last line of file
    12G             Go to line 12
    12j             Jump 12 lines down (use relative numbers!)

    Ctrl+d          Scroll half page down
    Ctrl+u          Scroll half page up

    %               Jump to matching bracket
    {               Previous blank line
    }               Next blank line

    s + 2 chars     Flash jump (our LazyVim plugin)
```

### The Vim Grammar: verb + noun

Vim commands follow a pattern: **operator** + **motion/text-object**

```
    d               delete (operator)
    c               change (delete + enter insert mode)
    y               yank (copy)
    v               visual select

    Combine with motions:
    dw              delete word
    d$              delete to end of line
    dd              delete entire line
    yy              yank entire line
    cw              change word (delete word + insert mode)
    ci"             change inside quotes
    da(             delete around parentheses
    yi{             yank inside braces
    vip             visual select inside paragraph
```

### Text Objects (the superpower)

| Text Object   | Inside (`i`)                 | Around (`a`)                     |
| ------------- | ---------------------------- | -------------------------------- |
| Word          | `ciw` change inner word      | `daw` delete a word (with space) |
| Quotes `"`    | `ci"` change inside quotes   | `da"` delete quotes + content    |
| Parens `()`   | `ci(` change inside parens   | `da(` delete parens + content    |
| Braces `{}`   | `ci{` change inside braces   | `da{` delete braces + content    |
| Brackets `[]` | `ci[` change inside brackets | `da[` delete brackets + content  |
| Tags `<>`     | `cit` change inside HTML tag | `dat` delete entire tag          |
| Paragraph     | `vip` select inner paragraph | `vap` select around paragraph    |

These work everywhere. `ci"` in `"hello world"` changes the content inside the quotes. This is the #1 productivity boost in Vim.

### Registers (clipboard slots)

```
    "ay             Yank to register a
    "ap             Paste from register a
    "+y             Yank to system clipboard
    "+p             Paste from system clipboard
    "0p             Paste from yank register (last yank, not delete)
    :reg            Show all registers
```

### Marks (bookmarks)

```
    ma              Set mark 'a' at current position
    'a              Jump to mark 'a'
    ''              Jump to previous position
    '.              Jump to last edit
```

### Search & Replace

```
    /pattern        Search forward
    ?pattern        Search backward
    n               Next match
    N               Previous match
    *               Search word under cursor (forward)
    #               Search word under cursor (backward)

    :s/old/new/g    Replace in current line
    :%s/old/new/g   Replace in entire file
    :%s/old/new/gc  Replace with confirmation
```

### Common Editing Patterns

```
    A               Append at end of line (enter insert mode)
    I               Insert at start of line
    o               Open new line below
    O               Open new line above
    J               Join current line with next
    ~               Toggle case of character
    .               Repeat last change (incredibly powerful)
    u               Undo
    Ctrl+r          Redo
```

### The 10 Commands That Cover 80% of Editing

1. `i` / `Esc` (or `jk`) — enter/exit insert mode
2. `dd` / `yy` / `p` — delete/copy/paste lines
3. `ciw` — change a word
4. `ci"` — change inside quotes
5. `/pattern` + `n` — search and navigate
6. `.` — repeat last change
7. `*` — search word under cursor
8. `ggVG` — select all
9. `>>` / `<<` — indent/unindent
10. `u` / `Ctrl+r` — undo/redo

---

## 13. SSH & Remote Workflow

tmux is essential for remote work — sessions persist even if your connection drops.

### Basic Remote Workflow

```bash
# SSH into server
ssh user@server

# Start or attach to tmux session
tmux attach -t work || tmux new -s work

# Work normally — if connection drops, tmux keeps running
# Reconnect and reattach:
ssh user@server
tmux attach -t work
# Everything is exactly where you left it
```

### Port Forwarding (for accessing remote services)

```bash
# Forward remote port 8080 to local 8080
ssh -L 8080:localhost:8080 user@server

# Forward multiple ports
ssh -L 8080:localhost:8080 -L 5432:localhost:5432 user@server
```

### Copy files

```bash
# scp
scp file.txt user@server:/path/

# rsync (better for large/repeated transfers)
rsync -avz ./src/ user@server:/path/src/
```

---

## 14. Maintenance

### Update Everything

```bash
# Update Homebrew + all packages
brew update && brew upgrade

# Update Neovim plugins (inside Neovim)
:Lazy update

# Update LSP servers (inside Neovim)
:Mason
# Press U to update all

# Update tmux plugins (inside tmux)
<prefix> U

# Update tldr pages
tldr --update

# Update fzf-tab
cd ~/.config/fzf-tab && git pull
```

### Sync Dotfiles After Changes

If you edit a config directly (e.g. `~/.config/ghostty/config`), the dotfile in the repo is already updated (symlinks). Just commit:

```bash
cd ~/github.com/akshaysangma/termdev
git add -A && git commit -m "update configs" && git push
```

If you edit in the repo, the live config updates instantly (same file via symlink).

### Backup tmux Sessions

```bash
# Manual save
<prefix> Ctrl+s

# Sessions auto-save every 15 minutes (tmux-continuum)
# After reboot, tmux auto-restores on first launch
```

---

## 15. Troubleshooting

| Issue                                             | Fix                                                               |
| ------------------------------------------------- | ----------------------------------------------------------------- |
| Ghostty theme `catppuccin-mocha` not found        | Use `Catppuccin Mocha` (space, capitals)                          |
| mason.nvim config error on LazyVim                | Use `"williamboman/mason.nvim"` in plugin specs                   |
| `golangci-lint` exit code 3                       | `brew install golangci-lint`                                      |
| Neovim provider warnings (python/ruby/perl)       | Safe to ignore — disabled in our options.lua                      |
| tmux `Ctrl+b I` doesn't install plugins           | Run `~/.tmux/plugins/tpm/bin/install_plugins`                     |
| zoxide warning about configuration                | Ensure `eval "$(zoxide init zsh)"` is the **last line** in .zshrc |
| Ghostty Quick Terminal not working                | Grant Accessibility permissions in System Settings                |
| `Alt+C` doesn't work in macOS terminal            | Use `Esc+C` instead (macOS intercepts Alt)                        |
| Neovim: "file changed on disk" after Claude edits | Normal — press `L` to reload or enable auto-reload                |
| tmux colors look wrong                            | Ensure `set -g default-terminal "tmux-256color"` in tmux.conf     |
| `bat` theme not found                             | Run `bat cache --build` after installing theme                    |
| Slow shell startup                                | Check with `time zsh -i -c exit` — should be under 200ms          |

---

## Appendix: Learning Path

If you're new to this stack, learn in this order:

1. **Week 1**: Ghostty basics + shell aliases + `z` + `Ctrl+R` + run `vimtutor`
2. **Week 2**: tmux sessions/panes + Claude Code CLI
3. **Week 3**: Neovim basics (movement, `<leader>` menu, file finding, `ciw`, `ci"`)
4. **Week 4**: Neovim LSP features + lazygit + text objects
5. **Ongoing**: Advanced Neovim (macros, flash, registers, marks), yazi, agent teams

The key is to learn one tool at a time. Don't try to master everything at once.

**Shortcuts to remember:**

- In Neovim: press `<leader>` and wait — which-key shows everything
- In Neovim: `<leader>sk` to search keymaps
- In tmux: `<prefix> ?` to list all bindings
- In lazygit: `?` for help
- In yazi: `~` for help
- In any fzf list: type to filter, `Enter` to confirm

---

# Monster Level

Everything below takes you from productive to dangerous.

---

## 16. tmux Project Layouts

Instead of manually creating panes every time, script your workspace per project.

### Simple Shell Script

Create `~/.local/bin/dev` (make sure `~/.local/bin` is in your PATH):

```bash
#!/bin/bash
# Usage: dev kraken | dev prisma | dev <project-name>
PROJECT="${1:-main}"
SESSION="$PROJECT"

# If session exists, attach
tmux has-session -t "$SESSION" 2>/dev/null && tmux attach -t "$SESSION" && exit

# Create new session with layout
DIR="$HOME/github.com/useinsider/$PROJECT"
[ ! -d "$DIR" ] && DIR="$HOME/github.com/akshaysangma/$PROJECT"
[ ! -d "$DIR" ] && DIR="$HOME" && echo "Warning: project dir not found, using home"

tmux new-session -d -s "$SESSION" -c "$DIR"

# Window 1: Editor + Claude Code
tmux rename-window -t "$SESSION:1" "code"
tmux send-keys -t "$SESSION:1" "nvim ." Enter
tmux split-window -h -t "$SESSION:1" -c "$DIR"
tmux send-keys -t "$SESSION:1.2" "claude" Enter
tmux select-pane -t "$SESSION:1.1"

# Window 2: Terminal (tests, builds, etc.)
tmux new-window -t "$SESSION" -n "term" -c "$DIR"
tmux split-window -v -t "$SESSION:2" -c "$DIR"

# Window 3: Git
tmux new-window -t "$SESSION" -n "git" -c "$DIR"
tmux send-keys -t "$SESSION:3" "lazygit" Enter

# Start on window 1
tmux select-window -t "$SESSION:1"
tmux attach -t "$SESSION"
```

```bash
chmod +x ~/.local/bin/dev
```

Now `dev kraken` gives you:

- **Window 1 "code"**: Neovim (left) | Claude Code (right)
- **Window 2 "term"**: Two terminal panes for tests/builds
- **Window 3 "git"**: lazygit full screen

### Per-Project Layouts

For projects needing specific layouts, create project-specific scripts:

```bash
# ~/.local/bin/dev-kraken
#!/bin/bash
# Kraken-specific: adds docker logs pane
tmux new-session -d -s kraken -c ~/github.com/useinsider/kraken
tmux send-keys "nvim ." Enter
tmux split-window -h -c ~/github.com/useinsider/kraken
tmux send-keys "claude" Enter
tmux split-window -v -c ~/github.com/useinsider/kraken
tmux send-keys "docker compose logs -f" Enter
tmux select-pane -t 1
tmux attach -t kraken
```

---

## 17. Neovim Debugging (DAP)

LazyVim has a DAP (Debug Adapter Protocol) extra. Enable it for step-through debugging.

### Setup

Add to `~/.config/nvim/lua/config/lazy.lua` inside the `spec` table:

```lua
{ import = "lazyvim.plugins.extras.dap.core" },
```

LazyVim auto-configures nvim-dap, nvim-dap-ui, and nvim-dap-virtual-text.

For Go, `delve` is already installed (from our lang extras). For TypeScript/Node, Mason installs the JS debug adapter automatically.

### DAP Keybinds

| Action                    | Shortcut     |
| ------------------------- | ------------ |
| Toggle breakpoint         | `<leader>db` |
| Start/continue debugging  | `<leader>dc` |
| Step over                 | `<leader>dO` |
| Step into                 | `<leader>di` |
| Step out                  | `<leader>do` |
| Toggle DAP UI             | `<leader>du` |
| Run to cursor             | `<leader>dC` |
| Evaluate expression       | `<leader>de` |
| Terminate                 | `<leader>dt` |
| Debug test (with neotest) | `<leader>td` |

### Go Debugging Workflow

```
1. Open a Go file
2. <leader>db on the line you want to break
3. <leader>dc to start debugging (select "Debug" or "Debug Test")
4. Debugger stops at breakpoint
5. Hover over variables to see values (virtual text shows inline)
6. <leader>dO to step over, <leader>di to step into
7. <leader>du to toggle the full debug UI (variables, call stack, watches)
8. <leader>dt to terminate
```

### TypeScript/Node Debugging

```
1. Add breakpoint: <leader>db
2. <leader>dc → select "Node: Launch File" or "Node: Attach"
3. Same step controls as Go
```

### Tips

- **Conditional breakpoints**: `<leader>dB` lets you set a condition (e.g., `i > 100`)
- **Log points**: Like breakpoints but print a message instead of stopping
- **Watch expressions**: In the DAP UI, add variables to "watches" to track them across steps
- **Virtual text**: Variable values appear inline next to your code as you step through

---

## 18. Advanced Claude Code Patterns

### CLAUDE.md Best Practices

Every project should have a `CLAUDE.md` at the root. Claude reads it automatically.

**What to include:**

```markdown
# CLAUDE.md

## Project Overview

One paragraph describing what this project does.

## Architecture

- src/api/ — REST API handlers
- src/services/ — Business logic
- src/models/ — Database models
- src/utils/ — Shared utilities

## Commands

- `make test` — run tests
- `make lint` — lint code
- `make build` — build project

## Conventions

- Use Go error wrapping: `fmt.Errorf("context: %w", err)`
- All API handlers must validate input before processing
- Tests use table-driven pattern
- Never commit .env files

## Current State

- Feature X is in progress on branch feature/x
- Known issue: Y is flaky in CI
```

**Rules for good CLAUDE.md:**

- Keep under 200 lines (Claude truncates after that)
- Be specific about conventions — Claude follows what you write
- Include common commands — Claude will use them
- Update it as the project evolves

### Git Worktrees (Parallel Isolated Agents)

Worktrees let multiple Claude agents work on the same repo **without conflicts** — each gets its own branch and working directory.

```bash
# Start Claude in an isolated worktree
claude --worktree fix-login-bug

# This creates:
# .claude/worktrees/fix-login-bug/  (isolated copy)
# Branch: worktree-fix-login-bug

# Run another agent simultaneously
claude --worktree add-caching

# Both agents work independently on different branches
# When done, merge the branches normally
```

**When to use worktrees vs tmux panes:**

| Scenario                         | Use                           |
| -------------------------------- | ----------------------------- |
| Agents touch **different files** | tmux panes (same branch)      |
| Agents touch **same files**      | Worktrees (isolated branches) |
| Quick parallel research          | tmux panes                    |
| Independent features             | Worktrees                     |

### Subagent Patterns

Claude Code can spawn subagents internally for parallel work.

**Sequential** (default) — one task at a time:

```
You: refactor auth module, then add tests, then update docs
```

**Parallel** — ask Claude to spawn subagents:

```
You: I need three things done in parallel:
1. Add input validation to all API handlers in src/api/
2. Write unit tests for src/services/auth.ts
3. Update the README with the new API endpoints

Use subagents to do these simultaneously.
```

**When parallel works:**

- Tasks touch different files
- No shared state between tasks
- Clear boundaries

**When parallel breaks:**

- Tasks depend on each other's output
- Multiple tasks modify the same file
- Tasks need to coordinate

### Context Window Management

```
/compact           # Summarize conversation, free up context
/clear             # Nuclear option — start fresh
Esc Esc            # Rewind last change (code + conversation)
```

**Strategy for long sessions:**

1. Start with a focused task description
2. Let Claude read files (don't paste code)
3. After 15-20 back-and-forths, use `/compact`
4. If Claude starts "forgetting" context, `/compact` or start fresh
5. Use `@file.ts` to re-anchor Claude on specific files

### Headless Automation

```bash
# Run a task non-interactively
claude -p "add error handling to all functions in src/api/" \
  --allowedTools Edit,Write,Read,Bash

# Chain multiple tasks
claude -p "fix lint errors" && claude -p "run tests and fix failures"

# Use in CI/CD
claude -p "review this PR for security issues" < diff.patch

# Pipe input
git diff HEAD~1 | claude -p "summarize these changes for a PR description"
```

### Multi-Agent Team Patterns

**Researcher + Implementer:**

```bash
# Pane 1: Researcher
claude "Analyze src/auth/ — document every function, its purpose,
  inputs, outputs, and any edge cases. Write to /tmp/auth-analysis.md"

# Pane 2: Implementer (start after researcher finishes)
claude "Read /tmp/auth-analysis.md. Now add refresh token support
  to the auth module following the existing patterns."
```

**Reviewer + Fixer:**

```bash
# Pane 1: Reviewer
claude "Review all files changed in the last commit.
  Write issues to /tmp/review.md with file:line format."

# Pane 2: Fixer
claude "Read /tmp/review.md and fix each issue listed."
```

**Test Writer + Implementer:**

```bash
# Pane 1: Test writer (TDD style — tests first)
claude "Write failing tests for a new UserProfile cache layer.
  It should cache getUserProfile results in Redis with 5min TTL."

# Pane 2: Implementer (after tests exist)
claude "Read the tests in src/cache/userProfile.test.ts.
  Implement the code to make all tests pass."
```

---

## 19. Git Power Moves

### Interactive Rebase (rewrite history)

```bash
# In lazygit: go to commits panel, press 'e' on a commit
# Or from terminal:
git rebase -i HEAD~5    # rewrite last 5 commits
```

In the rebase editor:

```
pick   abc1234  Add feature       # keep as-is
squash def5678  Fix typo          # merge into previous commit
fixup  ghi9012  Another fix       # merge, discard message
reword jkl3456  Bad message       # change commit message
drop   mno7890  Oops              # delete this commit
edit   pqr1234  Needs splitting   # pause here to amend
```

**Common patterns:**

```bash
# Squash last 3 commits into one
git rebase -i HEAD~3    # mark 2nd and 3rd as 'squash'

# Reorder commits
git rebase -i HEAD~5    # rearrange the lines

# Edit a commit message
git rebase -i HEAD~3    # mark as 'reword'
```

### Git Bisect (find which commit broke something)

```bash
git bisect start
git bisect bad              # current commit is broken
git bisect good v1.0.0      # this tag/commit was working
# Git checks out a middle commit
# Test it, then:
git bisect good             # or 'git bisect bad'
# Repeat until Git finds the exact commit
git bisect reset            # done, go back to original state
```

**Automate with a test:**

```bash
git bisect start HEAD v1.0.0
git bisect run make test    # Git runs your test on each commit automatically
```

### Git Reflog (rescue anything)

```bash
git reflog                  # shows EVERY state your repo has been in
# Find the commit hash you want to recover
git checkout abc1234        # go look at it
git branch rescue abc1234   # or create a branch from it
```

**Common rescues:**

```bash
# Undo a bad reset
git reflog
git reset --hard HEAD@{2}   # go back 2 operations

# Recover a deleted branch
git reflog
git branch recovered abc1234

# Undo a bad rebase
git reflog
git reset --hard HEAD@{5}   # before the rebase started
```

### Stash Workflows

```bash
git stash                   # save uncommitted changes
git stash -m "wip: feature" # with a message
git stash list              # see all stashes
git stash pop               # apply most recent + delete it
git stash apply stash@{2}   # apply specific stash, keep it
git stash drop stash@{0}    # delete a stash
git stash branch new-branch # create branch from stash

# Stash specific files
git stash push -m "partial" src/api/handler.go
```

### Advanced Git Aliases

Add to `.gitconfig`:

```gitconfig
[alias]
    # Pretty log
    lg = log --oneline --graph --decorate --all
    # Show what I did today
    today = log --since='6am' --oneline --author='Akshay'
    # Undo last commit (keep changes)
    undo = reset --soft HEAD~1
    # Amend without editing message
    oops = commit --amend --no-edit
    # Show changed files between branches
    changed = diff --name-only
```

---

## 20. Shell Piping & Composition

The terminal's superpower: composing small tools into powerful pipelines.

### Pipe Basics

```bash
# | sends stdout of left to stdin of right
command1 | command2 | command3

# Examples:
rg "TODO" | wc -l                          # count TODOs
rg "func " --no-filename | sort | uniq     # list unique function names
fd -e go | xargs wc -l | sort -n           # Go files by line count
git log --oneline | head -20               # last 20 commits
ps aux | rg node                           # find node processes
```

### xargs (turn input into arguments)

```bash
# Delete all .log files
fd -e log | xargs rm

# Open all Go files with TODOs in Neovim
rg -l "TODO" --type go | xargs nvim

# Run tests for changed files
git diff --name-only | grep _test.go | xargs go test

# Parallel execution (-P flag)
fd -e png | xargs -P 4 optipng              # compress 4 images at a time
```

### Process Substitution

```bash
# Compare two command outputs
diff <(git branch -r) <(git branch -l)

# Sort and compare two files
diff <(sort file1.txt) <(sort file2.txt)
```

### Real-World Pipelines

```bash
# Find largest files in repo
fd --type f | xargs du -h | sort -rh | head -20

# Find functions with more than 50 lines (Go)
rg -n "^func " --type go | while read line; do
  file=$(echo "$line" | cut -d: -f1)
  linenum=$(echo "$line" | cut -d: -f2)
  echo "$file:$linenum"
done

# Generate a markdown list of all API endpoints
rg "router\.(GET|POST|PUT|DELETE)" --no-heading --type go \
  | sd '.*router\.(GET|POST|PUT|DELETE)\("([^"]+)".*' '- $1 `$2`' \
  | sort

# Count lines of code by language
fd --type f | xargs wc -l 2>/dev/null | sort -rn | head -20

# Find duplicate files by content
fd --type f | xargs md5sum | sort | uniq -w32 -d

# Quick JSON API exploration
curl -s https://api.example.com/users | jq '.[] | {name, email}'

# Chain Claude with shell
git diff HEAD~1 | claude -p "write a changelog entry for these changes"

# Monitor logs and alert
tail -f app.log | rg --line-buffered "ERROR" | while read line; do
  echo "ERROR: $line" | tee -a errors.log
done
```

### Useful One-Liners

```bash
# Replace string across entire project
rg -l "oldName" --type ts | xargs sd "oldName" "newName"

# Find files changed in last 24h
fd --changed-within 24h

# Show git contributors ranked by commits
git shortlog -sn --all

# Find all ports in use
lsof -i -P -n | rg LISTEN

# Watch a command (refresh every 2s)
watch -n 2 'git status --short'

# Create a quick HTTP server
python3 -m http.server 8000

# Get your public IP
curl -s ifconfig.me
```

---

## 21. Neovim Macros in Practice

Macros record a sequence of keystrokes and replay them. They're the terminal developer's "automation for repetitive edits."

### Basic Macro Flow

```
qa          Start recording to register 'a'
(do edits)  Your keystrokes are recorded
q           Stop recording
@a          Replay macro once
5@a         Replay 5 times
@@          Replay last macro
```

### Real-World Examples

**Add error handling to multiple functions:**

Starting with:

```go
result := doSomething()
result2 := doAnother()
result3 := doThird()
```

Record macro on first line:

```
qa                    # start recording
^                     # go to start of line
ct=                   # change to '=' → now in insert mode
result, err :=        # type the new text
Esc                   # exit insert mode
A                     # append at end of line
(enter)               # new line
if err != nil {       # type error handling
(enter)
    return err
(enter)
}
Esc                   # back to normal mode
j                     # move to next line
q                     # stop recording
2@a                   # replay on next 2 lines
```

**Convert a list to JSON:**

Starting with:

```
apple
banana
cherry
```

```
qa                    # start recording
I"Esc                 # insert " at start
A",Esc                # append ", at end
j                     # next line
q                     # stop recording
2@a                   # replay on remaining lines
```

**Add console.log for debugging:**

```
qa                    # start
yiw                   # yank inner word (variable name)
o                     # open line below
console.log("        # type start
Esc                   # exit insert
pa                    # paste variable name, append
:", Esc               # type :",
pa                    # paste again
A);Esc                # close the statement
j                     # next line
q                     # stop
```

Result: `console.log("varName:", varName);`

### Macro Tips

- **Plan before recording**: Think through the exact keystrokes
- **Start from a consistent position**: Use `0` or `^` at the start
- **End on the next line**: So `@a` chains naturally
- **Use word motions, not character motions**: `w`, `b`, `e` instead of `l`
- **Test on one line first**: `@a` once, then `100@a` if it works
- **Edit a macro**: `"ap` to paste register a as text, edit it, then `"ay$` to save back
- **Recursive macros**: `qaqa` (clear a), then `qa ... @a q` — the macro calls itself until it fails (end of file)

---

## Appendix: Learning Path

If you're new to this stack, learn in this order:

1. **Week 1**: Ghostty basics + shell aliases + `z` + `Ctrl+R` + run `vimtutor`
2. **Week 2**: tmux sessions/panes + Claude Code CLI
3. **Week 3**: Neovim basics (movement, `<leader>` menu, file finding, `ciw`, `ci"`)
4. **Week 4**: Neovim LSP features + lazygit + text objects
5. **Month 2**: Shell piping + git power moves + macros
6. **Month 3**: Claude Code agent teams + worktrees + DAP debugging + project layouts
7. **Ongoing**: Build muscle memory. Speed comes from not thinking about the tool.

**How to practice:**

- Do `vimtutor` once a week for the first month
- Force yourself to use `rg` instead of GitHub search
- Force yourself to use lazygit instead of `git` commands for a week
- Pick one Vim motion per day and use it everywhere
- After a month, your fingers will know more than your brain

**Shortcuts to remember:**

- In Neovim: press `<leader>` and wait — which-key shows everything
- In Neovim: `<leader>sk` to search keymaps
- In tmux: `<prefix> ?` to list all bindings
- In lazygit: `?` for help
- In yazi: `~` for help
- In any fzf list: type to filter, `Enter` to confirm

Sources:

- [Vim Motions Cheatsheet (LazyVim friendly)](https://ahmedjama.com/blog/2025/12/vim-motions-cheatsheet/)
- [LazyVim Cheatsheet](https://cheatography.com/thesujit/cheat-sheets/lazyvim-neovim/)
- [Vim: The Complete Guide 2026](https://devtoolbox.dedyn.io/blog/vim-complete-guide)
- [Claude Code Common Workflows](https://code.claude.com/docs/en/common-workflows)
- [Claude Code Agent Teams Guide](https://claudefa.st/blog/guide/agents/agent-teams)
- [Claude Code Sub-Agent Patterns](https://claudefa.st/blog/guide/agents/sub-agent-best-practices)
- [LazyVim DAP Core](http://www.lazyvim.org/extras/dap/core)
- [nvim-dap-go](https://github.com/leoluz/nvim-dap-go)

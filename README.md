# .config

Personal dotfiles. Live configs are mirrored here; run `./sync.sh` to refresh from `$HOME` (secrets redacted).

## Navigation

| Tool | Path in repo | Live location | Key files |
|---|---|---|---|
| Neovim | [`nvim/`](nvim) | `~/.config/nvim` | [`init.lua`](nvim/init.lua), [`lua/`](nvim/lua), [`lsp/`](nvim/lsp), [`lazy-lock.json`](nvim/lazy-lock.json) |
| Fish | [`fish/`](fish) | `~/.config/fish` | [`config.fish`](fish/config.fish), [`fish_plugins`](fish/fish_plugins), [`conf.d/`](fish/conf.d), [`functions/`](fish/functions), [`completions/`](fish/completions) |
| Alacritty | [`alacritty/`](alacritty) | `~/.config/alacritty` | [`alacritty.toml`](alacritty/alacritty.toml) |
| tmux | [`tmux/`](tmux) | `~/.tmux.conf` | [`tmux.conf`](tmux/tmux.conf) |
| Claude Code | [`claude/`](claude) | `~/.claude` | [`CLAUDE.md`](claude/CLAUDE.md), [`settings.json`](claude/settings.json), [`rules/`](claude/rules), [`hooks/`](claude/hooks) |
| Codex | [`codex/`](codex) | `~/.codex` | [`AGENTS.md`](codex/AGENTS.md), [`config.toml`](codex/config.toml), [`rules/`](codex/rules) |
| Hermes | [`hermes/`](hermes) | `~/.hermes` | [`config.yaml`](hermes/config.yaml), [`SOUL.md`](hermes/SOUL.md) |

## Not stored

Auth and credentials, history, sessions, sqlite DBs, plugins, agents, skills, memories.

Codex `config.toml` bearer token is `REDACTED`; restore by hand after copying.

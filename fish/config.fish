set -g fish_greeting

# env
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER bat
set -gx MANPAGER "nvim +Man!"
set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border"

# paths (fish_add_path dedups)
fish_add_path -g ~/.local/bin
fish_add_path -g ~/.antigravity/antigravity/bin

# abbreviations
abbr -a e nvim
abbr -a m make
abbr -a k kubectl
abbr -a kctx 'kubectl config use-context'
abbr -a kns 'kubectl config set-context --current --namespace'
abbr -a g git
abbr -a ga 'git add -p'
abbr -a gc 'git commit -m'
abbr -a gco 'git checkout'
abbr -a gd 'git diff'
abbr -a gl 'git pull'
abbr -a gp 'git push'
abbr -a gs 'git status'
abbr -a lg lazygit

if command -q eza
    abbr -a l eza
    abbr -a ls eza
    abbr -a ll 'eza -l'
    abbr -a lll 'eza -la'
else
    abbr -a l ls
    abbr -a ll 'ls -l'
    abbr -a lll 'ls -la'
end

if command -q xh
    abbr -a http xh
end

if command -q bat
    abbr -a cat 'bat --style=plain'
end

if status is-interactive
    # one shared tmux session per terminal; skip inside nvim/editors
    if command -q tmux; and not set -q TMUX; and not set -q NVIM; and not set -q INSIDE_EMACS; and test "$TERM_PROGRAM" != vscode
        exec tmux new-session -A -s main
    end

    set -gx GPG_TTY (tty)

    command -q fnm; and fnm env --use-on-cd --shell fish | source
    command -q mise; and mise activate fish | source
    command -q starship; and starship init fish | source
    command -q zoxide; and zoxide init fish --cmd z | source
    command -q direnv; and direnv hook fish | source
    command -q atuin; and atuin init fish --disable-up-arrow | source
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# OpenClaw Completion
test -f "/Users/kitanoyoru/.openclaw/completions/openclaw.fish"; and source "/Users/kitanoyoru/.openclaw/completions/openclaw.fish"

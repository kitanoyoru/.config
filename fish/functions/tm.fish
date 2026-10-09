function tm --description 'pick a tmux session with fzf and attach/switch'
    set -l s (tmux ls -F '#S' 2>/dev/null | fzf --prompt 'session> ')
    test -n "$s"; or return
    if set -q TMUX
        tmux switch-client -t $s
    else
        tmux attach -t $s
    end
end

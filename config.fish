set fish_greeting ""

if status is-interactive
and not set -q TMUX
    exec tmux
end

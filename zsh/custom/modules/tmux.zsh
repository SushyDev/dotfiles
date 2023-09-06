# Start tmux session
[ -z "$TMUX" ] && tmux -f "$DOTFILES/tmux/tmux.conf" new-session -A -s main

# Exit shell if tmux is not running
[ -z "$TMUX" ] && echo "tmux is not running" && exit 1

# Set tmux conf
[ ! -z "$TMUX" ] && tmux source-file "$DOTFILES/tmux/tmux.conf" > /dev/null 2>&1

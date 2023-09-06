# Set path to oh-my-zsh
export ZSH="$DOTFILES/zsh/oh-my-zsh"
export ZSH_CUSTOM="$DOTFILES/zsh/custom"

# Set theme
source $ZSH_CUSTOM/themes/vapor.zsh

# Aliases
source "$ZSH_CUSTOM/aliases.zsh"

# Add autocomplete
source "$ZSH_CUSTOM/modules/bash-completion.zsh"

# Add brew
source "$ZSH_CUSTOM/modules/brew.zsh"

# Functions
source "$ZSH_CUSTOM/functions.zsh"

# Add github-copilot
source "$ZSH_CUSTOM/modules/github-copilot.zsh"

# Add nvm
source "$ZSH_CUSTOM/modules/nvm.zsh"

# Set plugins
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Start tmux session
[ -z "$TMUX" ] && tmux -f "$DOTFILES/tmux/tmux.conf" new-session -A -s main

# Set tmux conf
# tmux source-file "$DOTFILES/tmux/tmux.conf" > /dev/null 2>&1

# Exit shell if tmux is not running
[ -z "$TMUX" ] && echo "tmux is not running" && exit 1

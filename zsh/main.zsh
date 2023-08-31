# Set path to oh-my-zsh
export ZSH="$DOTFILES/zsh/oh-my-zsh"
export ZSH_CUSTOM="$DOTFILES/zsh/custom"

# Set theme
source $ZSH_CUSTOM/themes/vapor.zsh

# Set plugins
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
source "$ZSH_CUSTOM/aliases.zsh"

# Functions
source "$ZSH_CUSTOM/functions.zsh"

# Add github-copilot
source "$ZSH_CUSTOM/modules/github-copilot.zsh"

# Add nvm
source "$ZSH_CUSTOM/modules/nvm.zsh"

# Add brew
source "$ZSH_CUSTOM/modules/brew.zsh"

# Start tmux session
[ -z "$TMUX" ] && tmux new-session -A -s main

# Set tmux conf
tmux source-file "$DOTFILES/tmux/tmux.conf" 

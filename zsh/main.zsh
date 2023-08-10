# Set path to oh-my-zsh
export ZSH="$DOTFILES/zsh/oh-my-zsh"
export ZSH_CUSTOM="$DOTFILES/zsh/custom"

# This is okay because permissions are configured beforehand
ZSH_DISABLE_COMPFIX=true

# Set theme
ZSH_THEME="vapor"

# Set plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# Set OS
OS=$(uname -s)

# Before we load oh-my-zsh we first need to define its configuration above

# Load oh-my-zsh
source "$ZSH/oh-my-zsh.sh"

# When oh-my-zsh is loaded we can start loading other things

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

# Set tmux conf
tmux source-file "$DOTFILES/tmux/tmux.conf" 

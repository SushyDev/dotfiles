# Set path to oh-my-zsh installation
export ZSH="$DOTFILES/zsh/oh-my-zsh"

# Set theme
ZSH_THEME="vapor"

# Add brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add github-copilot
source "$DOTFILES/zsh/github-copilot.zsh"

# Add nvm
source "$DOTFILES/zsh/nvm.zsh"

# Aliases
source "$DOTFILES/zsh/aliases.zsh"

# Functions
source "$DOTFILES/zsh/functions.zsh"

# Set plugins
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

# Set tmux conf
tmux source-file "$DOTFILES/tmux/tmux.conf" 

# Load oh-my-zsh
source "$ZSH/oh-my-zsh.sh"

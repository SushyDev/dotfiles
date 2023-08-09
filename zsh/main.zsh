# Set theme
ZSH_THEME="vapor"

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

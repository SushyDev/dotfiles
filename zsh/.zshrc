# Environment
export ZSH_CUSTOM="$DOTFILES/zsh/custom"

# Lib
source "$ZSH_CUSTOM/lib/evalcache.zsh"
source "$ZSH_CUSTOM/lib/init-completions.zsh"
source "$ZSH_CUSTOM/lib/1password.zsh"
source "$ZSH_CUSTOM/lib/fix-cursor.zsh"
source "$ZSH_CUSTOM/lib/git.zsh"

# Modules
source "$ZSH_CUSTOM/modules/pkgx.zsh"
source "$ZSH_CUSTOM/modules/tmux.zsh"
source "$ZSH_CUSTOM/modules/github-copilot.zsh"

# General
source "$ZSH_CUSTOM/themes/vapor.zsh"
source "$ZSH_CUSTOM/aliases.zsh"
source "$ZSH_CUSTOM/functions.zsh"

# Plugins
zstyle '*:compinit' arguments -u

source "$ZSH_CUSTOM/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "$ZSH_CUSTOM/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "$ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_CUSTOM/plugins/zsh-vi-mode/zsh-vi-mode.zsh"

# Load user zshrc
[ -r "$HOME/.zshrc" ] && source "$HOME/.zshrc"

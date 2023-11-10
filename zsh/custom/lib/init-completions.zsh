# Run this function to add additional completions to .compdump

autoload -U compinit && compinit -u

fpath+=($ZSH_CUSTOM/completions $fpath)

[ -d "$HOME/.config/completions" ] && fpath+=("$HOME/.config/completions")

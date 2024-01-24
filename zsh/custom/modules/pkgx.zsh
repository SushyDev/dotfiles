[ ! "$(command -v pkgx)" ] && echo "Installing pkgx" && sudo zsh -c 'eval "$(curl -Ssf https://pkgx.sh)"'

eval "$(pkgx --shellcode)"

[ ! $(command -v tmux) ] && env +tmux
[ ! $(command -v fzf) ] && env +fzf
[ ! $(command -v rg) ] && env +rg
[ ! $(command -v nvim) ] && env +neovim.io

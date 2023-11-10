[ ! "$(command -v pkgx)" ] && eval "$(curl -Ssf https://pkgx.sh)"

eval "$(pkgx --shellcode)"

[ ! $(command -v tmux) ] && env +tmux

[ ! $(command -v fzf) ] && env +fzf
[ ! $(command -v rg) ] && env +rg
[ ! $(command -v nvim) ] && env +neovim.io

[ ! $(command -v php) ] && env +php
[ ! $(command -v node) ] && env +node@20

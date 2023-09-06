[ "$(uname)" != "Darwin" ] && return
_evalcache /opt/homebrew/bin/brew shellenv
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

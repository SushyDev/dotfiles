readonly PATH="$PATH";
readonly XDG_HOME="${XDG_HOME:-${HOME}/.config}";

readonly DOTFILES_DIR="${DOTFILES_DIR:-$(cd $(dirname $0) && pwd)}";
readonly STATE_FILE="$XDG_HOME/dotfiles/stow";

stow \
	--dir="$(cat $STATE_FILE)" \
	--delete \
	--no-folding \
	--ignore='\.DS_Store' \
	--ignore='zsh' \
	--ignore='git' \
	--ignore='nvim/lazy-lock\.json' \
	.config -t "$XDG_HOME";

rm "$0";
rm "$STATE_FILE";

readonly PATH="$PATH";
readonly XDG_HOME="$XDG_HOME:${HOME}/.config";

echo $PATH;

readonly DOTFILES_DIR=$(cd $(dirname $0) && pwd);
readonly STATE_FILE="$XDG_HOME/dotfiles/stow";

mkdir -p $(dirname $STATE_FILE);

if [ -f $STATE_FILE ]; then
	stow \
		--dir=$(cat $STATE_FILE) \
		--delete \
		--no-folding \
		--ignore='\.DS_Store' \
		--ignore='zsh' \
		--ignore='git' \
		--ignore='nvim/lazy-lock\.json' \
		.config -t $XDG_HOME;

	rm $STATE_FILE;
fi

git submodule update --init --recursive --remote;

stow \
	--dir=$DOTFILES_DIR \
	--restow \
	--no-folding \
	--ignore='\.DS_Store' \
	--ignore='zsh' \
	--ignore='git' \
	--ignore='nvim/lazy-lock\.json' \
	.config -t $XDG_HOME;

echo $DOTFILES_DIR > $STATE_FILE;

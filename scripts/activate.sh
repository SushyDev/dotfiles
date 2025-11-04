#!/usr/bin/env bash

readonly PATH="$PATH";
readonly XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}";
readonly XDG_STATE_HOME="${XDG_STATE_HOME:-${HOME}/.local/state}";

readonly DOTFILES_DIR="${DOTFILES_DIR:-$(cd $(dirname $0) && pwd)}";
readonly DEACTIVATE_DIR="$XDG_STATE_HOME/dotfiles";
readonly DEACTIVATE_SCRIPT="$DEACTIVATE_DIR/deactivate.sh";

mkdir -p "$DEACTIVATE_DIR";

if [ -f "$DEACTIVATE_SCRIPT" ]; then
	bash "$DEACTIVATE_SCRIPT";
	rm "$DEACTIVATE_SCRIPT";
fi

mkdir -p "$XDG_CONFIG_HOME";

stow \
	--dir="$DOTFILES_DIR" \
	--restow \
	--no-folding \
	--ignore='\.DS_Store' \
	--ignore='.*/.*\.md' \
	--ignore='zsh' \
	--ignore='git/config' \
	--ignore='nvim/lazy-lock\.json' \
	.config -t "$XDG_CONFIG_HOME";

cat > "$DEACTIVATE_SCRIPT" << 'EOF'
#!/usr/bin/env bash

readonly DOTFILES_DIR="$DOTFILES_DIR_PLACEHOLDER";
readonly XDG_CONFIG_HOME="$XDG_CONFIG_HOME_PLACEHOLDER";

stow \
	--dir="$DOTFILES_DIR" \
	--delete \
	--no-folding \
	--ignore='\.DS_Store' \
	--ignore='.*/.*\.md' \
	--ignore='zsh' \
	--ignore='git/config' \
	--ignore='nvim/lazy-lock\.json' \
	.config -t "$XDG_CONFIG_HOME";
EOF

sed -i "s|\$DOTFILES_DIR_PLACEHOLDER|$DOTFILES_DIR|g" "$DEACTIVATE_SCRIPT";
sed -i "s|\$XDG_CONFIG_HOME_PLACEHOLDER|$XDG_CONFIG_HOME|g" "$DEACTIVATE_SCRIPT";

chmod +x "$DEACTIVATE_SCRIPT";

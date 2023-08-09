# Install modules
git -C $DOTFILES submodule update --init --recursive

rm -rf "$DOTFILES/zsh/oh-my-zsh/custom"
ln -s "$DOTFILES/zsh/custom" "$DOTFILES/zsh/oh-my-zsh/custom"

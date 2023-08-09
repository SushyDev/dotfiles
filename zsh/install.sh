# Install modules
git submodule update --init --recursive

# Symlink custom folder
rm -rf "$DOTFILES/zsh/oh-my-zsh/custom"
ln -s "$DOTFILES/zsh/custom" "$DOTFILES/zsh/oh-my-zsh/custom"

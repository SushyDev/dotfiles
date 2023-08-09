# Install modules
git -C $DOTFILES submodule update --init --recursive

# Create symlink
rm -rf "$DOTFILES/zsh/oh-my-zsh/custom"
ln -s "$DOTFILES/zsh/custom" "$DOTFILES/zsh/oh-my-zsh/custom"

# Start new ZSH session
zsh

# NVIM install
Just a symlink:
`ln -s $DOTFILES/nvim $HOME/.config/nvim`

# Kitty install
`ln -s $DOTFILES/kitty $HOME/.config/kitty`

# ZSH install
Update your `~/.zshrc`:
```sh
export DOTFILES="/path/to/dotfiles"
source "$DOTFILES/zsh/main.zsh"
```

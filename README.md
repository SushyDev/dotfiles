# NVIM install
Just a symlink:
`ln -s $DOTFILES/nvim $HOME/.config/nvim`

# Kitty install
`ln -s $DOTFILES/kitty $HOME/.config/kitty`

# ZSH install
Update your `~/.zprofile`:
```sh
export PROJECTS="/path/to/projects"
export DOTFILES="/path/to/dotfiles"
ZDOTDIR=$DOTFILES/zsh
```

# NVIM install
`ln -s $DOTFILES/nvim $HOME/.config/nvim`
# Kitty install
`ln -s $DOTFILES/kitty $HOME/.config/kitty`
# Tmux install
`ln -s $DOTFILES/tmux $HOME/.config/tmux`

# ZSH install
Update your `~/.zprofile`:
```sh
export PROJECTS="/path/to/projects"
export DOTFILES="/path/to/dotfiles"
ZDOTDIR=$DOTFILES/zsh
```

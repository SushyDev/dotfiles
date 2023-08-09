# NVim install
Just a symlink:
`ln -s /Users/Shared/config/nvim "$HOME/.config/nvim"`

# ZSH install
Update your `~/.zshrc`:
```sh
export DOTFILES="/path/to/dotfiles"
source "$DOTFILES/zsh/main.zsh"
```

After reloading your shell run:
`$DOTFILES/zsh/install.sh`

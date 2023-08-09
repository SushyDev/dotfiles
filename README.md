for neovim create a symlink
`ln -s /Users/Shared/config/nvim "$HOME/.config/nvim"`

# ZSH INSTALL
Set your $DOTFILES path:
`DOTFILES="/Users/Shared/config`

Install OMZ
`ZSH="$DOTFILES/zsh/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

Symlink custom folder:
`rm -rf "$DOTFILES/zsh/oh-my-zsh/custom"`
`ln -s "$DOTFILES/zsh/custom/" "$DOTFILES/zsh/oh-my-zsh/custom"`

Install OMZ Autocomplete
`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

Install OMZ Syntax highlighting
`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

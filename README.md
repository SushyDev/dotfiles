The fanciest least fancy dotfiles you'll ever find, configuration focused on staying minimal whilst enabling great power, flexibility and speed in your terminal.

Tools used/configured:
- [kitty](https://sw.kovidgoyal.net/kitty/)
- [zsh](https://github.com/zsh-users/zsh)
- [pkgx](https://pkgx.sh)
- [tmux](https://github.com/tmux/tmux)
- [fzf](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [neovim](https://neovim.io)

## Ultra portable
Utilizing the power of PKGX to make these dotfiles ultra portable, NO depenencies are required. It will utilize your installed packages and any package you are missing will be filled in by pkgx for your current shell session. This means that if for example you already have `tmux` or `neovim` installed these dotfiles will utilize them however if they are missing you won't have to install them or take any action at all! (Of course you will still need zsh and the terminal app)

## Curious yet?
Try it out on Github Codespaces

Configure your terminal profile to start as interactive login shell
```json
"terminal.integrated.profiles.linux": {
    "zsh": {
        "path": "zsh",
        "args": ["-l", "-i"]
    },
}
```

Either [configure your dotfiles for codespaces](https://github.com/settings/codespaces) to this repo or start a codespace in this repo and run the install script

### ZSH install
Update your `~/.zprofile`:
```sh
export PROJECTS="/path/to/projects"
export DOTFILES="/path/to/dotfiles"
ZDOTDIR=$DOTFILES/zsh
```

### Tmux install
```sh
ln -s $DOTFILES/tmux $HOME/.config/tmux
```

### NVIM install
```sh
ln -s $DOTFILES/nvim $HOME/.config/nvim
```

### Kitty install
```sh
ln -s $DOTFILES/kitty $HOME/.config/kitty
```

### 1Password
[Make sure you have configured the global SSH_AUTH_SOCK](https://developer.1password.com/docs/ssh/agent/compatibility/#configure-ssh_auth_sock-globally-for-every-client)

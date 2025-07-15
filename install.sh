echo "Pulling submodules"
git submodule update --init --recursive --remote

echo "Stowing config"
pkgx stow .config -t ~/.config

echo "Reload your shell"

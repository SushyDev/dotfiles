echo "Pulling submodules"
git submodule update --init --recursive --remote

echo "Stowing config"
pkgx stow . --adopt

echo "Reload your shell"

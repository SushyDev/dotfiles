echo "Pulling submodules"
git submodule update --init --recursive --remote

echo "Stowing config"
nix run nixpkgs#stow -- --no-folding --ignore='\.DS_Store' .config -t ~/.config

echo "Reload your shell"

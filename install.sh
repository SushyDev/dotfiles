DOTFILES=$(cd $(dirname $0); pwd)

echo "Entrypoint: $DOTFILES"

echo "Pulling submodules"
git submodule update --init --recursive --remote

echo "Updating zsh"
[ -e $HOME/.zprofile ] && mv $HOME/.zprofile $HOME/.zprofile.bak
echo "export DOTFILES=$DOTFILES" >> $HOME/.zprofile
echo "ZDOTDIR=\$DOTFILES/zsh" >> $HOME/.zprofile

[ ! -d $HOME/.config/.bak ] && mkdir $HOME/.config/.bak

echo "Updating nvim"
[ -d $HOME/.config/nvim ] && mv $HOME/.config/nvim $HOME/.config/.bak/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

echo "Updating kitty"
[ -d $HOME/.config/kitty ] && mv $HOME/.config/kitty $HOME/.config/.bak/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty

echo "Updating tmux"
[ -d $HOME/.config/tmux ] && mv $HOME/.config/tmux $HOME/.config/.bak/tmux
ln -s $DOTFILES/tmux $HOME/.config/tmux

echo "Moving old .zshrc"
[ -e $HOME/.zshrc ] && mv $HOME/.zshrc $HOME/.zshrc.bak

echo "Old dotfiles are moved to $HOME/.config/.bak"

echo "Reload your shell"

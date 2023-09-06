DOTFILES=$(cd $(dirname $0); pwd)

echo "Entrypoint: $DOTFILES"

read -p "Continue? (y/n): " yn
case "$yn" in [yY]*) ;; *) echo "Abort." ; exit ;; esac

echo "Updating zsh"
mv $HOME/.zprofile $HOME/.zprofile.bak
echo "export DOTFILES=$DOTFILES" >> $HOME/.zprofile
echo "ZDOTDIR=$DOTFILES/zsh" >> $HOME/.zprofile

[ ! -d $HOME/.config/.bak ] && mkdir $HOME/.config/.bak

echo "Updating nvim"
[ -d $HOME/.config/nvim ] && mv $HOME/.config/nvim $HOME/.config/.bak/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

echo "Updating kitty"
[ -d $HOME/.config/kitty ] && mv $HOME/.config/kitty $HOME/.config/.bak/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty

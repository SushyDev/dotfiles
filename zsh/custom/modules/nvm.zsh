[ ! -r "$(brew --prefix)/opt/nvm/nvm.sh" ] && return
source "$(brew --prefix)/opt/nvm/nvm.sh"  
export NVM_DIR="$HOME/.nvm"

if [ "$OS" = "Darwin" ]; then
  export NVM_DIR="$HOME/.nvm"

  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  

  # This loads nvm bash_completion
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  

  echo "Module: nvm"
fi

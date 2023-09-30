# Run this function to add additional completions to .compdump

autoload -U compinit && compinit -u

function _init_comp() {
  fpath=($ZSH_CUSTOM/completions $fpath)
  echo "fpath: $fpath"

  _evalcache fnm completions
}

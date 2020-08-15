# Setup nvm
# Use lazy loading since nvm takes so dang long to load
if [ -s "$HOME"/.nvm ]; then
  export NVM_DIR="$HOME"/.nvm
  function nvm {
    if [ -s "$NVM_DIR"/nvm.sh ]; then
      source "$NVM_DIR"/nvm.sh
      nvm use system
      nvm $@
    fi
  }
fi

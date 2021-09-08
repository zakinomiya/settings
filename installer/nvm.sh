#!/bin/zsh

if ! test -d $HOME/.nvm; then
  mkdir $HOME/.nvm
fi

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | zsh

echo "export NVM_DIR=\"\$HOME/.nvm\"" >> $HOME/.zshrc
echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && . \"\$NVM_DIR/nvm.sh\"" >> $HOME/.zshrc
echo "[ -s \"\$NVM_DIR/bash_completion\" ] && . \"\$NVM_DIR/bash_completion\"" >> $HOME/.zshrc

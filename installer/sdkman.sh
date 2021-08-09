#!/bin/zsh

curl -s "https://get.sdkman.io" | bash

echo source '"$HOME/.sdkman/bin/sdkman-init.sh"' >> $HOME/.zshrc

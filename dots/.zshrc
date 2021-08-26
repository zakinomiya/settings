if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
#
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

####### User configuration ####### 

export XDG_CONFIG_HOME=$HOME/.config
export NVIM_CONFIG_HOME=$XDG_CONFIG_HOME/nvim
export GOPATH=~/go
export GOROOT=/usr/local/go
export GOBIN="$GOPATH/bin"

####### Customization #######

set -o vi
bindkey "jj" vi-cmd-mode

####### Alias & Function #######
alias vim="nvim"
alias tmpalias="source $XDG_CONFIG_HOME/tmpalias.sh"
alias eiv="vim $NVIM_CONFIG_HOME/init.vim"

alias pj="cd ~/repo"
chrome () { /opt/google/chrome/google-chrome "$PWD/$1" & ; }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -s "$XDG_CONFIG_HOME/tmpalias.sh" ] && tmpalias
export PATH="$PATH:/home/zaki/.local/share/coursier/bin"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="$PATH:/Users/zaki/Library/Application Support/Coursier/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/zaki/.sdkman"
[[ -s "/Users/zaki/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/zaki/.sdkman/bin/sdkman-init.sh"
source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

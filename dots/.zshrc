if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit && compinit
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
export NOTESDIR="$HOME/repo/zakinomiya_blog/content/blog"
export COMP_PATH=$XDG_CONFIG_HOME/completions

####### Customization #######

set -o vi
bindkey "jk" vi-cmd-mode

####### Alias & Function #######

source $HOME/.alias
[ -s "$XDG_CONFIG_HOME/tmpalias.sh" ] && tmpalias
export PATH="$PATH:$HOME/.local/share/coursier/bin"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"
export PATH="$PATH:$HOME/.local/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/zaki/.sdkman"
[[ -s "/Users/zaki/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/zaki/.sdkman/bin/sdkman-init.sh"
source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"


alias luamake=/tmp/lua-language-server/3rd/luamake/luamake

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

fpath=( "$COMP_PATH" "${fpath[@]}" )
autoload -Uz _notes
autoload -Uz _pj 

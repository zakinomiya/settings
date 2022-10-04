if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

####### Path configuration ####### 

export XDG_CONFIG_HOME=$HOME/.config
export NVIM_CONFIG_HOME=$XDG_CONFIG_HOME/nvim
export GOPATH=~/go
# export GOROOT=/usr/local/go
export GOBIN="$GOPATH/bin"
export NOTESDIR="$HOME/notes"
export ZK_NOTEBOOK_DIR=$NOTESDIR
export COMP_PATH=$XDG_CONFIG_HOME/completions
export LSP_PATH=$XDG_CONFIG_HOME/lsp
export TODO_DIR="$HOME/.config/todo"
fpath=( "$COMP_PATH" "${fpath[@]}" )

####### Completion configuration ####### 

plugins=(docker)
autoload -Uz _notes
autoload -Uz _pj 
autoload -Uz compinit && compinit
export ZSH="$HOME/.oh-my-zsh"

HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt share_history
setopt hist_ignore_all_dups

ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

####### Customization #######

set -o vi


####### Keybind #######

bindkey -e
bindkey "jk" vi-cmd-mode
bindkey '^R' history-incremental-search-backward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

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


# bun completions
[ -s "/Users/zaki/.bun/_bun" ] && source "/Users/zaki/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


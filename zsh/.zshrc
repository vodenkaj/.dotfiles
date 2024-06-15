export ZSH=$HOME/.zsh
export SYSTEMD_EDITOR=nvim

export VISUAL=nvim
export EDITOR=nvim

# Yarn path
export PATH="/home/janv/.yarn/bin:$PATH:/home/janv/.cargo/bin"

source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/fzf-git.sh/fzf-git.sh

source $HOME/scripts.sh

# Load features
autoload -U edit-command-line
autoload -Uz compinit && compinit

bindkey -e
zle -N edit-command-line
bindkey "^e" edit-command-line
bindkey "^[[Z" autosuggest-accept
bindkey -s ^N "tmxSession\n"
bindkey -s ^F "nvfzf\n"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# History
export HISTFILE=$ZSH/.zsh_history
# How many commands zsh will load to memory.
export HISTSIZE=10000
# How many commands history will save on file.
export SAVEHIST=10000
# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS
# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS

setopt INC_APPEND_HISTORY

# General aliases
alias ncfg='cd /home/janv/.dotfiles/nvim/.config/nvim'
alias nv='nvim'
alias nvfzf='fzfToVim'
alias rng='vifm'
alias ls='ls --color=auto'
alias ..='cd ..'

# Git
alias gap='git add -p'
alias gp='git push --force-with-lease'
alias gsc='gitSmartCheckout'
alias gs='git status'
alias gc='git checkout'
alias g='git'
alias ga='git add'
alias gdo='g diff @{upstream}'
alias ge='gitContinue'

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS='--bind tab:toggle-up,btab:toggle-down'
export VIMRC='/home/janv/.config/nvim/init.lua';
export T_SESSION_USE_GIT_ROOT="true"

eval "$(fzf --zsh)"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f "$HOME/.work" ]; then
    source "$HOME/.work"
fi

eval "$(starship init zsh)"

alias dbcli="cargo r --manifest-path ~/Documents/rusty-db-cli/rusty_db_cli/Cargo.toml"
alias clipaste="xclip -o -selection clipboard"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/janv/google-cloud-sdk/path.zsh.inc' ]; then . '/home/janv/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/janv/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/janv/google-cloud-sdk/completion.zsh.inc'; fi

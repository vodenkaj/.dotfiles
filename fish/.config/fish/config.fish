source $HOME/scripts.fish

export EDITOR=nvim
alias ncfg='cd /home/janv/.dotfiles/nvim/.config/nvim'
alias nv='nvim'
alias nvfzf='fzfToVim'
alias rng='vifm'

# git
alias gap='git add -p'
alias ga='git add'
alias gp='git push --force-with-lease'
alias gs='git status'
alias gc='git checkout'
alias g='git'

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS='--bind tab:toggle-up,btab:toggle-down'

export VIMRC='/home/janv/.config/nvim/init.lua';

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_user_key_bindings
    bind -M insert \e\[Z accept-autosuggestion
    bind -M insert \ce edit_command_buffer
    bind -M insert \cf nvfzf
    bind -M insert \cn tmxSession
end

if test -f "$HOME/.work"
    source "$HOME/.work"
end

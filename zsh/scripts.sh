tmxSession () {
    selected=$(find ~/Documents -maxdepth 2 -mindepth 2 -type d | fzf)
    selected_name=$(basename "$selected" | tr . _)
    if [ -z $selected ]; then
        return
    elif ! tmux has -t=$selected_name; then
        tmux new -d -s $selected_name -c ${selected}
        tmxAttachOrSwitch $selected_name
    else
        tmxAttachOrSwitch $selected_name
    fi
}

tmxAttachOrSwitch () {
    if [ -z "$TMUX" ]; then
        tmux a -t "$1"
    else
        tmux switch-client -t "$1"
    fi
}

fzfToVim() {
    file=$(fzf)
    if [ -n "$file" ]; then
        nvim "$file"
    fi
}

gitSmartCheckout() {
    selected=$(g branch | sed "s/^\( \|\*\) //gm" | fzf)
    if [[ ! -z $selected ]]; then
        git checkout $selected
    fi
}

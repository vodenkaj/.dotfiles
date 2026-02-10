tmxSession () {
    selected=$({ find ~/Documents/reas/ -maxdepth 1 -mindepth 1 -type d & find ~/Documents -maxdepth 1 -mindepth 1 -type d;} | fzf)
    selected_name=$(basename "$selected" | tr . _)
    if [ -z $selected ]; then
        return
    elif ! tmux info &>/dev/null || ! tmux has -t=$selected_name &>/dev/null; then
        tmux new -d -s $selected_name -c ${selected} 2>/dev/null
        tmxAttachOrSwitch $selected_name
    else
        tmxAttachOrSwitch $selected_name
    fi
}

tmxAttachOrSwitch () {
    if [ -z "$TMUX" ]; then
        tmux a -t "$1"
    else
        tmux switch-client -t "$1" 2>/dev/null
    fi
}

fzfToVim() {
    file=$(fzf)
    if [ -n "$file" ]; then
        nvim "$file"
    fi
}

gitSmartCheckout() {
    selected=$(g branch -r | sed "s/^\( \|\*\) //gm" | fzf)
    if [[ ! -z $selected ]]; then
        git checkout $selected
    fi
}

gitContinue() {
  file=$(git diff --name-only HEAD~1 | fzf)
  if [ -n "$file" ]; then
      nvim "$file"
  fi
}

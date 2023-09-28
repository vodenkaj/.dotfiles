function tmxAttachOrSwitch
    if [ -z "$TMUX" ];
        tmux a -t "$argv"
    else
        tmux switch-client -t "$argv"
    end
end

function tmxSession
    set -l selected $(find ~/Documents -maxdepth 2 -mindepth 2 -type d | fzf)
    set -l selected_name $(basename "$selected" | tr . _)
    if [ -z $selected ]
        return
    else if ! tmux has -t=$selected_name
        tmux new -d -s $selected_name -c $selected
        tmxAttachOrSwitch $selected_name
    else
        tmxAttachOrSwitch $selected_name
    end
end

function fzfToVim
    set -l file $(fzf)
    if [ -n "$file" ];
        nvim "$file"
    end
end

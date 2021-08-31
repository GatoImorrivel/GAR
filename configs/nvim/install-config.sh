#!/bin/bash
function abspath {
    if [[ -d "$1" ]]
    then
        pushd "$1" >/dev/null
        pwd
        popd >/dev/null
    elif [[ -e $1 ]]
    then
        pushd "$(dirname "$1")" >/dev/null
        # echo "$(pwd)/$(basename "$1")"
        result="$(pwd)/$(basename "$1")"
        popd >/dev/null
    else
        # echo "$1" does not exist! >&2
        return 127
    fi
}

abspath "./settings.vim"
settings_path=$result
mkdir -p ~/.config/nvim
printf "execute \"source \" . fnamemodify(\""${settings_path}\"", \":p\")" > ~/.config/nvim/init.vim
cp ./coc-settings.json ~/.config/nvim/coc-settings.json

#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in the current
# directory
############################

########## Variables

dir=$(dirname "$(readlink -f "$0")")        # dotfiles directory
echo "Changing directory to $dir"
cd "$dir"
files=$(find config/ -type f)            # list of files to deal with 
hostname="$HOSTNAME"
IFS=$'\n'

function buildFile() {
    relative=$1
    file=${relative#config/}

    if [[ -e "./override/$hostname/$file" ]]; then
        . "./override/$hostname/$file"
    fi

    if [ -n "$location" ]; then
        echo "Overrode File: ~/$file"
        tmp=$(mktemp)
        cp -f "$relative" "$tmp"
        for i in "${!method[@]}"; do
            if [ "${method[$i]}" == "before" ]; then
                gawk -i inplace -v loc="${location[$i]}"  -v ins="${string[$i]}" '$0 ~ loc {print ins}1' "$tmp"
            elif [ "${method[$i]}" == "after" ]; then
                gawk -i inplace -v loc="${location[$i]}"  -v ins="${string[$i]}" '$0 ~ loc {print;print ins;next}1' "$tmp"
            elif [ "${method[$i]}" == "replace" ]; then
                gawk -i inplace -v loc="${location[$i]}"  -v ins="${string[$i]}" '{sub(loc, ins)}1' "$tmp"
            elif [ "${method[$i]}" == "append" ]; then
                echo "${string[$i]}" >> $tmp
            fi
        done
        mkdir -p $(dirname "$HOME/file")
	cp "$tmp" ~/"$file"
        rm "$tmp"
    else
        echo "Copied File: ~/$file"
        mkdir -p $(dirname "$HOME/$file")
        cp "$relative" "$HOME/$file"
    fi
}

for file_full in $files; do
    buildFile "$file_full"
done


prompt="
Reload configs? [y/N] "
read $reload -n 1 -p "$prompt" reload
if [ "$reload" == y ] || [ "$reload" == Y ]; then
    fc-cache -f&
    xrdb merge ~/.Xresources
    i3-msg restart
    pkill -USR1 compton
    pkill dunst
    ranger --copy-config=all &> /dev/null
    echo "...done"
else
    printf "\n"
fi

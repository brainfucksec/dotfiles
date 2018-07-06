#!/usr/bin/env bash


readonly cur_dir=$(pwd)


printf "%s\\n" "[*] Updating git packages, please wait..."

# update all git packages through directories
for i in $(find . -name ".git" | cut -c 3-); do
    printf "%s\\n" ""
    printf "%s\\n" "$i"

    cd "$i"
    cd ..

    git pull

    cd "$cur_dir"
done

printf "\\n%s\\n" "[*] Complete!"

#!/bin/bash

if  [[ $1 == "-a" ]];
then
    for file in $(ls -Atr); do
    git add "$file"
    echo -e "\u001b[32;1m Added $file \u001b[0m"
    git commit -m "Add $file"
    done
else
PS3="Enter file number: "
select file in $(ls -At); do

    echo -en "\u001b[34;1m Add $file? (y/n) \u001b[0m"
    read -r input
    if [[ "$input" == "Y" || "$input" == "y" ]];
    then
        git add "$file"
        echo -e "\u001b[32;1m Added $file \u001b[0m"
    else
        continue
    fi

    echo -en "\u001b[34;1m Enter commit message: \u001b[0m"
    read -r msg
    if [ -z "$msg" ]
    then
        git commit -m "Add $file"
        continue
    else
        git commit -m "$msg"
        continue
    fi

    done
fi

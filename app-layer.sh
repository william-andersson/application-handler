#!/bin/bash

TARGET="/Applications"
while true; do

    APPLICATIONS=($(ls -A $TARGET))

    for item in ${APPLICATIONS[*]}; do
        #Look for application packages to install.
        if [[ ${item: -4} == ".pkg" ]]; then
            tar -xzf $TARGET/$item -C $TARGET
            rm $TARGET/$item
            cp $TARGET/${item::-4}/*.desktop $TARGET
            mv $TARGET/${item::-4} $TARGET/.${item::-4}

        #Look for missing .desktop files to remove application.
        elif [[ $item == .*  ]]; then
            if [[ ! -f $TARGET/${item#?}.desktop ]]; then
                rm -r $TARGET/$item
            fi
        fi
    done
    sleep 1
done

#!/usr/bin/env bash
[[ $(wl-paste) == "" ]] && exit
if grep -x "$(wl-paste)" ~/.clipboard
then
        grep -xv "$(wl-paste)" ~/.clipboard > ~/tmp
        mv ~/tmp ~/.clipboard
fi
wl-paste >> ~/.clipboard

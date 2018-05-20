#!/usr/bin/env zsh

git pull git@github.com:robbyrussell/oh-my-zsh.git master
git submodule init
git submodule update
git status
echo
echo "If you're happy with what you see, run "
echo
echo "git push"
echo

#!/usr/bin/env zsh

git pull
git pull git@github.com:robbyrussell/oh-my-zsh.git master

git submodule init
git submodule update
for dir in ${ZSH}/custom-shared/plugins/*; do
  if [[ -e ${dir}/.git ]]; then
    pushd $dir &>/dev/null
    echo Updating $dir
    git pull origin master
    popd &>/dev/null
  fi
done

git status

echo
echo "If you're happy with what you see, run "
echo
echo "  ${WHITE}git commit -am 'Updating all' && git push${RESET}"
echo

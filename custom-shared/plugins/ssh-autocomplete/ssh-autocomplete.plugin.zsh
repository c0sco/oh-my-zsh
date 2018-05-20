local PROGGIES='(ssh|scp|sftp|slogin)'

# Don't add users in the autocomplete list, .ssh/config should know who we want to ssh as
zstyle ':completion:*:'${PROGGIES}':*' users 

# Modified version of https://serverfault.com/a/170481
h=()
if [[ -r ~/.ssh/config ]]; then
  h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi

if [[ -r ~/.ssh/known_hosts ]]; then
  h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
fi

if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:'${PROGGIES}':*' hosts $h
fi

if [ -x "`which anyenv`" ]; then
  eval "$(anyenv init -)"
fi

if [ -x "`which direnv`" ]; then
  eval "$(direnv hook zsh)"
fi

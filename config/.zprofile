if [ -x "`which direnv`" ]; then
  eval "$(direnv hook zsh)"
fi

if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

eval $(/opt/homebrew/bin/brew shellenv)


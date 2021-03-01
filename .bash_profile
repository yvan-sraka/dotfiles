# include .profile if it exists
if [ -f "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi

PS1="\n\[\e[0;34m\][ \[\e[0;90m\]\A \[\e[0;32m\]\u@\h \[\e[0;94m\]\W\[\e[0;34m\] ]\n\[\e[1;32m\]\$ \[\e[0m\]"

autoload -U +X bashcompinit && bashcompinit

eval "$(direnv hook bash)"
eval "$(starship init bash)"
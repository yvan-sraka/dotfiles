# include .profile if it exists
if [ -f "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
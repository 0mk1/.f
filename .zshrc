export ZSH=$HOME/.oh-my-zsh  # Oh-my-zsh
export LANG=en_US.UTF-8
export EDITOR='vim'
export UPDATE_ZSH_DAYS=30

ZSH_THEME="toffi9"

plugins=(virtualenv docker docker-compose)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

export WORKON_HOME=~/.virtualenvs
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3' # This needs to be placed before the virtualenvwrapper command
export PROJECT_HOME=$HOME/Projekty
source /usr/local/bin/virtualenvwrapper.sh

stty -ixon  # Ctrl + s not hanging vim
/usr/bin/setxkbmap -option "caps:swapescape"

export PATH="$PATH:$HOME/bin"      # add my custom scripts

# Always work in a tmux session if tmux is installed
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux -2 attach -t workspace || tmux -2 new -s workspace; exit
  fi
fi

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh

# .zshrc
#
# ============================================================================
#   Main Configs
# ============================================================================
export ZSH=/home/toffi9/.oh-my-zsh  # Oh-my-zsh

export LANG=en_US.UTF-8
export EDITOR='vim'

ZSH_THEME="toffi9"
export UPDATE_ZSH_DAYS=30

# ============================================================================
#   Plugins
# ============================================================================
plugins=(virtualenv)

# ============================================================================
#   Exports and configs
# ============================================================================
# Main export
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# Nvm, node, npm configs
# export NVM_DIR="/home/toffi9/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# NPM_PACKAGES="${HOME}/.npm-packages"
# NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
# PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# unset MANPATH # delete if you already modified MANPATH elsewhere in your config
# MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Python3 virtualenv/venvwrapper
export WORKON_HOME=~/.virtualenvs
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3' # This needs to be placed before the virtualenvwrapper command
export PROJECT_HOME=$HOME/Projekty
source /usr/local/bin/virtualenvwrapper.sh

# Virtualenv && tmux integration
if [ -n "$VIRTUAL_ENV" ]; then
    workon `basename $VIRTUAL_ENV`
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Ctrl + s not hanging vim
stty -ixon

# Always work in a tmux session if tmux is installed
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux -2 attach -t workspace || tmux -2 new -s workspace; exit
  fi
fi

# ============================================================================
#   Aliases
# ============================================================================
source $HOME/.aliases

# ============================================================================
source $ZSH/oh-my-zsh.sh

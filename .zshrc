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
export PATH="$PATH:$HOME/bin"      # add my custom scripts
export PATH="$HOME/.cargo/bin:$PATH"

# Python3 virtualenv/venvwrapper
export WORKON_HOME=~/.virtualenvs
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3' # This needs to be placed before the virtualenvwrapper command
export PROJECT_HOME=$HOME/Projekty
source /usr/local/bin/virtualenvwrapper.sh

# Ctrl + s not hanging vim
stty -ixon

/usr/bin/setxkbmap -option "caps:swapescape"

# ============================================================================
#   Aliases
# ============================================================================
source $HOME/.aliases

# ============================================================================
source $ZSH/oh-my-zsh.sh

# ============================================================================
export PATH="/home/toffi9/bin:$PATH"

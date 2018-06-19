source $HOME/antigen.zsh
export LANG=en_US.UTF-8
export EDITOR='vim'
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=$HOME/Projects
export VIRTUALENVWRAPPER_PYTHON=$(which python3)

antigen use oh-my-zsh
antigen bundle ssh-agent
antigen bundle docker  # only autocomplete
antigen bundle docker-compose  # only autocomplete
antigen bundle virtualenv
antigen bundle virtualenvwrapper
antigen bundle jonmosco/kube-ps1
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen apply
source $HOME/bin/awsp_functions

KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=""
ZSH_THEME_VIRTUALENV_PREFIX="🐍 %{$fg[green]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="⎇ %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{*%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}%{✔%G%}"

PROMPT='%{$fg[blue]%}%~/ %{$reset_color%}$(git_prompt_status)$(git_prompt_info)
%{$fg[white]%}λ %{$reset_color%}'
RPROMPT='$(aws_prof) $(kube_ps1) $(virtualenv_prompt_info)'

export PATH="/usr/local/sbin:/usr/local/bin:$HOME/.local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--color=dark,spinner:80,pointer:80"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

stty -ixon  # Ctrl + s not hanging vim

eval "$(pyenv init -)"
eval "$(pipenv --completion)"

source $HOME/.aliases

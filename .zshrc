export LANG=en_US.UTF-8
export EDITOR='nvim'
export PATH="/usr/local/sbin:/usr/local/bin:$HOME/.local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/bin"
export TERM=xterm-256color

source $HOME/antigen.zsh
antigen use oh-my-zsh
antigen bundle ssh-agent
antigen bundle vi-mode
antigen apply
source $HOME/.aliases
source /usr/local/opt/kube-ps1/share/kube-ps1.sh
source $HOME/bin/awsp_functions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

stty -ixon  # Ctrl + s not hanging vim

export KUBECTL_VERSION=1.13
export GPG_TTY=$(tty)
export FZF_DEFAULT_OPTS="--color=dark,spinner:80,pointer:80"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=""
KUBE_PS1_NS_ENABLE=true
KUBE_PS1_SEPARATOR=""
KUBE_PS1_CTX_COLOR="black"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{*%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}%{✔%G%}"
PROMPT='%{$fg[blue]%}%1~ %{$fg[white]%}λ %{$reset_color%}'
RPROMPT='$(vi_mode_prompt_info) $(aws_prof) $(git_prompt_info) $(kube_ps1)'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mateuszkamycki/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mateuszkamycki/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mateuszkamycki/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mateuszkamycki/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

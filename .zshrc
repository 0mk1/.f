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

stty -ixon  # Ctrl + s not hanging vim

export KUBECTL_VERSION=1.13
export GPG_TTY=$(tty)
export FZF_DEFAULT_OPTS="--color=dark,spinner:80,pointer:80"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{*%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}%{✔%G%}"
PROMPT='%{$fg[blue]%}%1~ $(git_prompt_info)%{$fg[white]%}λ %{$reset_color%}'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

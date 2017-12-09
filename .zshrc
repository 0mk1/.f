source $HOME/antigen.zsh
export LANG=en_US.UTF-8
export EDITOR='vim'

antigen use oh-my-zsh
antigen bundle ssh-agent
antigen bundle git
antigen bundle mercurial
antigen bundle docker
antigen bundle docker-compose
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen apply

PROMPT='%F{cyan}%n@%m%{$reset_color%}%{$fg[blue]%} %~/ %{$reset_color%}$(git_prompt_status)$(git_prompt_info)$(hg_prompt_info)
%{$fg[white]%}λ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_HG_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%}"

export PATH="/usr/local/sbin:/usr/local/bin:$HOME/.local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--color=dark,spinner:80,pointer:80"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

stty -ixon  # Ctrl + s not hanging vim
source $HOME/.aliases

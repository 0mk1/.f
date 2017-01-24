# toffi9.zsh-theme

PROMPT='%F{cyan}%n@%m%{$reset_color%}%{$fg[blue]%} %~/ %{$reset_color%}$(git_prompt_status)$(git_prompt_info) $(virtualenv_prompt_info)
%{$fg[white]%}λ %{$reset_color%}'

ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[red]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

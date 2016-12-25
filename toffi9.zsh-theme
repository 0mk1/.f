# toffi9.zsh-theme

PROMPT='%F{cyan}%n@%m%{$fg[blue]%} %~/ $(git_prompt_status)$(git_prompt_info) %{$fg[red]%}$(virtualenv_prompt_info)
%{$fg[white]%}λ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

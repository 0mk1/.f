# toffi9.zsh-theme
# λ

PROMPT='%{$fg[red]%}%n%{$fg[yellow]%}@%{$fg[blue]%}%m%{$fg[yellow]%} %~/ $(git_prompt_status)$(git_prompt_info) %{$fg[gfeen]%}$(virtualenv_prompt_info)
%{$fg[white]%}λ %{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}++ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}mod "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-- "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}rname "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}umrg "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}utr "

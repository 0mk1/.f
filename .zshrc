export LANG=en_US.UTF-8
export EDITOR='nvim'
export PATH="/usr/local/sbin:/usr/local/bin:$HOME/.local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/bin"
export TERM=xterm-256color

source $HOME/antigen.zsh
antigen use oh-my-zsh
antigen bundle gitfast
antigen bundle vi-mode
antigen apply

stty -ixon  # Ctrl + s not hanging vim

# Fix SSH agent forwarding in tmux/screen by always having the forwarding socket
# on the same path.
if [ -S "$SSH_AUTH_SOCK" ] && [ ! -h "$SSH_AUTH_SOCK" ]; then
  ln -sf "$SSH_AUTH_SOCK" $HOME/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=$HOME/.ssh/ssh_auth_sock
(ssh-add -l | grep -q "Error connecting to agent") && ssh-agent zsh
(ssh-add -l | grep -q "no identities") && ssh-add -k

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
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"
PROMPT='%{$fg[blue]%}%1~ $(git_prompt_info)%{$fg[white]%}🐋 %{$reset_color%}'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source awsp_functions.sh
source $HOME/.aliases
complete -W "$(cat $HOME/.aws/credentials | grep -Eo '\[.*\]' | tr -d '[]')" _awsSwitchProfile
complete -W "$(cat $HOME/.aws/config | grep -Eo '\[.*\]' | tr -d '[]' | cut -d " " -f 2)" _awsSetProfile

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mateuszkamycki/code/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mateuszkamycki/code/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mateuszkamycki/code/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mateuszkamycki/code/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/python@3.7/bin:$PATH"

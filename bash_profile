if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv init -)"

# If the shell is interactive and .bashrc exists, get the aliases and functions
if [[ $- == *i* && -f ~/.bashrc ]]; then
    . ~/.bashrc
fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -r "/usr/local/etc/bash_completion.d/git-completion.bash" ]] && . "/usr/local/etc/bash_completion.d/git-completion.bash"
#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#   . $(brew --prefix)/etc/bash_completion
#fi
#source <(kubectl completion bash)
#if [ -f /usr/local/share/bash-completion/bash_completion ]; then
#  . /usr/local/share/bash-completion/bash_completion
#fi
source /usr/local/etc/bash_completion.d/kubectl

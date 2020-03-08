# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle -e ':completion:*:(ssh|scp|sshfs|ping|telnet|nc|rsync):*' hosts 'reply=( ${=${${(M)${(f)"$(<~/.ssh/config)"}:#Host*}#Host }:#*\**} )'
zstyle :compinstall filename '/home/max/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
setopt autocd extendedglob notify
# End of lines configured by zsh-newuser-install
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# User exports
export GPG_TTY=$(tty) # FIX git commit signing

# User PATH exports
export PATH="$PATH:$HOME/.local/bin" # python Pipenv

# Custom user sources
# source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval $( dircolors -b $HOME/.dircolors )
source ~/.zsh-filetype-highlighting

# Custom user aliases
alias ls="ls -FG --color"
alias la="ls -Al"
alias ll="la -sh"

alias ..="cd .."

alias gcm="git commit -m"
alias gpom="git push origin master"

alias python="python3.8"
alias pip="python -m pip"

alias gmake="g++ -Wall -Weffc++ -Wextra -Wsign-conversion"

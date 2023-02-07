case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f ~/.bash_completion ]; then
    . ~/.bash_completion
fi

### USER STUFF ###

function clear_line() {
    echo -e "\e[1A\e[K\e[1A"
}

function clear_screen() {
    clear && printf '\e[3J'
}

# Terminal prompts
export VIRTUAL_ENV_DISABLE_PROMPT=1
function virtual_env() {
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "[$venv]"
}

function parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \(\1\)/'
}

BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"

RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
PURPLE="\[$(tput setaf 5)\]"

B_RED="\[$(tput setaf 9)\]"
B_GREEN="\[$(tput setaf 10)\]"
B_YELLOW="\[$(tput setaf 11)\]"
B_BLUE="\[$(tput setaf 12)\]"
B_PURPLE="\[$(tput setaf 13)\]"

export PS1="${BOLD}${BLUE}\w${PURPLE}\$(parse_git_branch) ${RESET}$ "
PROMPT_COMMAND='history -a; echo -ne "\033]0;$PWD\007"'

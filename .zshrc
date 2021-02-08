# Lines configured by zsh-newuser-install
autoload -U colors && colors
PS1="%B%{$fg[red]%}[$fg[yellow]%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

alias ls="ls --color"
# LS_COLORS="di=1;35:fi=0:ln=31:pi=5:so=5:or=31:mi=0:ex=35:*.rpm=90:*.gif=36:*.jpg=35:*.c=92:*.txt=91"
# export LS_COLORS

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
setopt autocd
unsetopt beep

# Vim
bindkey -v
export KEYTIMEOUT=1

function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] ||
	   [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] ||
	     [[ ${KEYMAP} == viins ]] ||
	     [[ ${KEYMAP} == '' ]] ||
	     [[ $1 == 'line' ]]; then
		echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
	zle -K viins
	echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne "\e[1 q" # default block cursor
preexec() { echo -ne '\e[1 q' ;} # Use block cursor on each prompt

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Aliases
alias l=ls
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias cl=clear
alias nv=nvim


# source /home/neutron/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

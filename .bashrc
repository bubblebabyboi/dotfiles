# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Custom Path 

# Adding the path to the python interpretor 
export PATH=/Users/albz/bin/Python3.8:$PATH
export PATH=/home/albz/.local/bin:$PATH

# Adding path to the boost library 
export PATH=/usr/share/boost-build:$PATH

# Adding miniconda path 
export PATH=${PATH}:~/miniconda3/bin

# Custom aliases 
alias matlab='matlab -nosplash -nodesktop'
alias python="ipython"
alias uwu='jp2a /home/albz/Pictures/Wallpapers/shinji.jpg  | lolcat --seed=400 -a --speed=200'
alias anime='~/Documents/code/gitrepos/bash/ani-cli/ani-cli' 
alias refresh='source ~/.bashrc'

alias cls='printf "\033c"'
alias mycode='cd /home/albz/Documents/code'
alias mypdfs='cd /home/albz/Documents/Important-PDFs/Education'
alias myinclude='cd /usr/include'
alias gpt='mycode && cd gitrepos/gpt4all/chat/ && ./gpt4all-lora-quantized-linux-x86'

alias cpumhz='watch -n.1 "grep \"^[c]pu MHz\" /proc/cpuinfo"'
alias cpprepl='source /home/albz/Documents/code/C++/libs/root/bin/thisroot.sh && root'
alias rocm_ver='apt show rocm-libs -a'

# Modelsim aliases 
alias modelsim='~/intelFPGA/*.*/modelsim_ase/bin/vsim'
alias vcom='~/intelFPGA/20.1/modelsim_ase/bin/vcom' 
alias vsim='~/intelFPGA/20.1/modelsim_ase/bin/vsim' 
alias vlog='~/intelFPGA/20.1/modelsim_ase/bin/vlog'


# Tab autocomplete 
bind TAB:menu-complete

# Custom functions

# Curls a cheat sheet with cmdline arguments  
cheat() {
	curl -s "cheat.sh/$1"
}

weather() {
	curl -s "wttr.in/$1"
}

crypto() {
	curl -s -q "rate.sx/$1"
}

open() {
	xdg-open $1
}


# Function to compile files with my desired flags
compile() {
    	case "$1" in 
    		-cpp) g++ -std=c++17 -O3 -Wall -Wextra -Wshadow -march=native $2 -o $3 ;; 					# outputs optimized C++
    		-cptemp) g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -o a template.cpp && ./a < inp;;	# template compile for codeforces
		-runtemp) ./a < inp;;												# just runs for codeforces
		-c) gcc -O3 $2 -o $3 ;; 											# outputs optimized C 
		-asm++) g++ -O3 -S $2 -o $3 ;; 											# outputs assembly C++ 
		-asm) gcc -O3 -S $2 -o $3 ;; 											# outputs assembly C
		-vhd) vcom -work work -2008 $2;;										# compiles vhdl files 
		-vlog) vlog -work work $2;;                             							# compiles verilog  
		-sv) vlog -sv -work work $2;;                           							# compiles system verilog 
		-py) python3 $2 ;; 												# outputs python 
		-js) node $2 ;; 												# node js 
	esac
}

cdls() { builtin cd "$@" && ls;}

# Function for shortcuts to commonly edited files 
edit() {
	case $1 in 
		-bash) vim /home/albz/.bashrc ;; 

	esac 
}
. "$HOME/.cargo/env"

export QSYS_ROOTDIR="/home/albz/intelFPGA_lite/20.1/quartus/sopc_builder/bin"

[ -f ~/.inshellisense/key-bindings.bash ] && source ~/.inshellisense/key-bindings.bash

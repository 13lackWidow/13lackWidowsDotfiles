#+----+
#|Vars|
#+----+
export TERM="xterm-256color"
export ZSH=/root/.oh-my-zsh
export EDITOR=vim
MSF_DATABASE_CONFIG=/usr/share/metasploit-framework/config/database.yml

#+--------+
#|HistSize|
#+--------+
HISTFILE=~/.histfile
HISTSIZE=25
SAVEHIST=25

#+----------+
#|Aesthetics|
#+----------+
#Theme
ZSH_THEME="powerlevel9k/powerlevel9k"

#PowerLevel9k Config
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_IP_BACKGROUND='black'
POWERLEVEL9K_IP_FOREGROUND='white'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'

#Colored Manuals
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;40;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

#Dircolors
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

#+-------+
#|Aliases|
#+-------+
alias ls='ls --color -F'
alias grep='grep --color=auto'
alias more='less'
alias hist='history | less'
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias 4cdl='sh ~/scripts/4cdl'
alias 4trips='sh ~/scripts/4trips'
alias music='mpd && ncmpcpp'
alias mute='killall mpd'

#Common Errors
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias quit=' exit'
alias cd..='cd ..'
alias vi='vim'
alias vmi='vim'
alias gedit='vim'
alias intsal='install'

#+--------+
#|Commands|
#+--------+
extract () {
    if [ -f $1 ] ; then
    case $1 in
    *.tar.bz2) tar xvjf $1 ;;
    *.tar.gz) tar xvzf $1 ;;
    *.bz2) bunzip2 $1 ;;
    *.rar) unrar x $1 ;;
    *.gz) gunzip $1 ;;
    *.tar) tar xvf $1 ;;
    *.tbz2) tar xvjf $1 ;;
    *.tgz) tar xvzf $1 ;;
    *.zip) unzip $1 ;;
    *.Z) uncompress $1 ;;
    *.7z) 7z x $1 ;;
    *) echo Dont know how to extract $1 ;;
    esac
    else
    echo $1 is not a valid file!
    fi
}

#+------------+
#|ZSH Defaults|
#+------------+


#Plugins Example format: plugins=(git git-extras tmux dirhistory python pip)
plugins=(git git-extras tmux dirhistory python pip wd sudo sublime catimg colored-man-pages nmap)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

setopt interactivecomments
setopt ignoreeof
setopt correctall
setopt globdots
source $HOME/.bash_aliases

export NVM_DIR="/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if ls --color -d . >/dev/null 2>&1; then
    # GNU
    alias ls='ls --color=auto'
elif ls -G -d . >/dev/null 2>&1; then
    # BSD
    alias ls='ls -G'
else
    # SOLARIS
fi

alias l='ls -F'
alias ll='ls -F -h -l'
alias la='ls -A -F -h -l'

alias grep='grep --color=auto --exclude-dir node_modules'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#alias grep='grep --exclude="*.svn*"'

if [[ (-f /usr/bin/grc) || (-f /usr/local/bin/grc) ]]; then
    alias ping="grc --colour=auto ping"
    alias traceroute="grc --colour=auto traceroute"
    alias make="grc --colour=auto make"
    alias diff="grc --colour=auto diff"
    alias cvs="grc --colour=auto cvs"
    alias netstat="grc --colour=auto netstat"

    alias logc="grc cat"
    alias logt="grc tail"
    alias logh="grc head"
fi

if echo | colordiff >/dev/null 2>&1; then
    alias diff='colordiff'
fi

alias :q='exit'

alias df='df -h'
alias du='du -h'

alias vim='vim -p'

alias su='sudo su -m'

alias gti="git"
alias gi="git"

alias fuck='sudo $(fc -ln -1)'

export NODE_ENV=development

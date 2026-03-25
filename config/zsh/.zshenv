export ZDOTDIR="$HOME/.config/zsh"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

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

# Catppuccin Mocha-ish palette for core CLI tools.
export CLICOLOR=1
export LSCOLORS='Gxfxcxdxbxegedabagacad'
export LS_COLORS='di=1;34:ln=1;36:so=1;35:pi=33:ex=1;32:bd=30;46:cd=30;43:su=37;41:sg=30;43:tw=30;42:ow=30;43'
export GREP_COLORS='mt=1;38;5;203:fn=38;5;111:ln=38;5;150:bn=38;5;150:se=38;5;245'

alias grep='grep --color=auto'
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
alias vi='vi -p'

alias su='sudo su -m'

alias gti="git"
alias gi="git"

alias fuck='sudo $(fc -ln -1)'

export NODE_ENV=development
export NVM_DIR=~/.nvm

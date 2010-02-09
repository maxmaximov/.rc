HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

bindkey -e

zstyle :compinstall filename '/home/maxmaximov/.zshrc'

#setopt correct
setopt correct_all

setopt autocd
setopt no_beep


autoload -Uz compinit
compinit

zmodload zsh/complist

zstyle ':completion:*' menu yes select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:processes' command 'ps -xuf'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]"

hosts=(${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\ *}%%,*})
zstyle ':completion:*:hosts' hosts $hosts
#hosts=(`cat ~/.ssh/known_hosts | tr , " " | awk '{ print $1 }'`)
#zstyle '*' hosts $hosts

zstyle ':completion:*:(ssh|scp):*:users' ignored-patterns `cat /etc/passwd | awk -F ":" '{ if($3<1000) print $1 }'`

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

autoload -U colors
colors

LS_COLORS='no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:do=00;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=00;32:*.tar=00;31:*.tgz=00;31:*.svgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.dz=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tbz2=00;31:*.tz=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.rar=00;31:*.ace=00;31:*.zoo=00;31:*.cpio=00;31:*.7z=00;31:*.rz=00;31:*.jpg=00;35:*.jpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.svg=00;35:*.mng=00;35:*.pcx=00;35:*.mov=00;35:*.mpg=00;35:*.mpeg=00;35:*.m2v=00;35:*.mkv=00;35:*.ogm=00;35:*.mp4=00;35:*.m4v=00;35:*.mp4v=00;35:*.vob=00;35:*.qt=00;35:*.nuv=00;35:*.wmv=00;35:*.asf=00;35:*.rm=00;35:*.rmvb=00;35:*.flc=00;35:*.avi=00;35:*.fli=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.yuv=00;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:';
export LS_COLORS


#autoload promptinit
#promptinit
#prompt bart

setopt prompt_subst

#export PROMPT='%{$fg[cyan]%}%n%{$fg[black]%}@%{$fg[blue]%}%m%{$fg[black]%}:%{$fg[red]%}%/%{$fg[black]%}%# %{$reset_color%}'
#export RPROMPT='%{$fg[blue]%}%T%{$reset_color%}'
export PROMPT='%{$fg[blue]%}%m%{$fg[black]%}:%{$fg[red]%}%/ %{$reset_color%}'
if [ "$USER" != 'maxmaximov' ]; then
    export PROMPT="${PROMPT}%{$bg[red]%}%{$fg[white]%} achtung! %{$reset_color%} "
fi

autoload -U predict-on
zle -N predict-on


#set -o vi
export EDITOR=vi

export DEBFULLNAME="Max Maximov"
export DEBEMAIL="maxmaximov@yandex-team.ru"


case $TERM in
    xterm*|rxvt)
        precmd () { print -Pn "\e]0;%n@%m: %~\a" }
        preexec () { print -Pn "\e]0;%n@%m: $1\a" }
        ;;
    screen)
        precmd () { print -Pn "\033k%~\033\\" }
        preexec () { print -Pn "\033k$1\033\\" }
        ;;
esac

set TERM xterm-256color; export TERM

if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# tell the shell that the function mycompletion can do completion
# when called by the widget name my-completion-widget, and that
# it behaves like the existing widget complete-word
zle -C my-completion-widget .complete-word mycompletion

# define a key that calls the completion widget
bindkey '^x^i' my-completion-widget

# define the function that will be called
mycompletion() {
# add a list of completions
    compadd alpha bravo charlie delta
}

umask 0002

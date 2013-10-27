ZSH=$HOME/oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh

ZSH_THEME="agnoster-light"

DEFAULT_USER=maxmaximov

plugins=(git bower brew command-not-found cloudapp git-extras jira node npm nyan osx web-search)

CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

JIRA_URL="https://jira.yandex-team.ru"
setopt no_beep

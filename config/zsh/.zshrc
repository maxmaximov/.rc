ZSH=$HOME/.config/zsh/oh-my-zsh
ZSH_CUSTOM=$HOME/.config/zsh

#ZSH_THEME="agnoster"
ZSH_THEME=""

DEFAULT_USER=maxmaximov

plugins=(git brew macos mise)

CASE_SENSITIVE="true"
#COMPLETION_WAITING_DOTS="true"

DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

source $ZSH/oh-my-zsh.sh

# zsh completion colors (Catppuccin Mocha-ish)
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-colors \
  'ma=1;38;5;203' \
  'hi=1;38;5;111' \
  'du=38;5;111' \
  'ln=38;5;111' \
  'ex=1;38;5;150' \
  'fi=38;5;252'

setopt no_beep

export NVM_DIR="$HOME/.nvm"

# nvm lazy-load to avoid startup penalty on every shell launch
if [[ -s "/opt/homebrew/opt/nvm/nvm.sh" ]]; then
  export NVM_SH="/opt/homebrew/opt/nvm/nvm.sh"
elif [[ -s "/usr/local/opt/nvm/nvm.sh" ]]; then
  export NVM_SH="/usr/local/opt/nvm/nvm.sh"
fi

_lazy_load_nvm() {
  unset -f nvm node npm npx
  [[ -n "${NVM_SH:-}" && -s "$NVM_SH" ]] && source "$NVM_SH"
}

nvm()  { _lazy_load_nvm; nvm "$@"; }
node() { _lazy_load_nvm; node "$@"; }
npm()  { _lazy_load_nvm; npm "$@"; }
npx()  { _lazy_load_nvm; npx "$@"; }

if [[ -e "$HOME/.env" ]]; then # -e works for 1Password's mounted FIFO, not just regular files
  set -a # auto-export variables loaded from the mounted .env file
  source "$HOME/.env"
  set +a
fi

#eval "$(starship init zsh)"
#eval "$(oh-my-posh --config 'catppuccin_macchiato' init zsh)"
#eval "$(oh-my-posh --config 'gruvbox' init zsh)"
#eval "$(oh-my-posh --config '/Users/maxmaximov/.config/oh-my-posh/catppuccin_macchiato.omp.json' init zsh)"
eval "$(oh-my-posh --config '/Users/maxmaximov/.config/oh-my-posh/gruvbox.omp.json' init zsh)"
eval "$(mise activate zsh)"

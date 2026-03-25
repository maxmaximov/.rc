export ZDOTDIR="$HOME/.config/zsh"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

if [[ -e "$HOME/.env" ]]; then # -e works for 1Password's mounted FIFO, not just regular files
  set -a # auto-export variables loaded from the mounted .env file
  source "$HOME/.env"
  set +a
fi

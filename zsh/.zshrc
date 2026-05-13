# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

tmux() {
    case "$1" in
        "")
            command tmux ls 2>/dev/null || echo "No sessions. Use: tmux new -s <name>"
            return 1
            ;;
        new|new-session)
            [[ " ${*:2} " == *" -s "* ]] || { echo "Name required: tmux new -s <name>"; return 1; }
            command tmux "$@"
            ;;
        a|at|att|attach|attach-session)
            [[ " ${*:2} " == *" -t "* ]] || { echo "Target required: tmux a -t <name>"; return 1; }
            command tmux "$@"
            ;;
        *)
            command tmux "$@"
            ;;
    esac
}

tmuxs() {
  emulate -L zsh
  setopt local_options null_glob

  if [[ -z "$1" ]]; then
    print -u2 "usage: tmuxs <template> [session-name]"
    print -u2 "       session-name defaults to current directory name"
    print -u2 "templates:"
    local dir="${TMUXIFIER_LAYOUT_PATH:-$HOME/.tmuxifier/layouts}"
    local -a layouts=("$dir"/*.session.sh)
    if (( ${#layouts} == 0 )); then
      print -u2 "  (no layouts found in $dir)"
    else
      local f
      for f in $layouts; do
        print -u2 "  ${${f:t}%.session.sh}"
      done
    fi
    return 1
  fi

  local session="${2:-${PWD:t}}"

  SESSION_NAME="$session" PROJECT_DIR="$PWD" tmuxifier load-session "$1"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/bin/env"

export PATH="$HOME/.config/tmux/plugins/tmuxifier/bin:$PATH"

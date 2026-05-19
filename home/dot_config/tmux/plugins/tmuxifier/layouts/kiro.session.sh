session_root "${PROJECT_DIR:-$PWD}"

if initialize_session "${SESSION_NAME:-kiro}"; then
  new_window "shell"
  [ -f "${PROJECT_DIR:-$PWD}/.venv/bin/activate" ] && run_cmd "source .venv/bin/activate"

  new_window "neovim"
  [ -f "${PROJECT_DIR:-$PWD}/.venv/bin/activate" ] && run_cmd "source .venv/bin/activate"

  new_window "kiro-cli"
  run_cmd "kiro-cli chat --resume-picker"

  select_window 1
fi

finalize_and_go_to_session

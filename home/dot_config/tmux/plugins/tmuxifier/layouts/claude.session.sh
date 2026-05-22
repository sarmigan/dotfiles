session_root "${PROJECT_DIR:-$PWD}"

if initialize_session "${SESSION_NAME:-py_agent_dev}"; then
  new_window "shell"
  [ -f "${PROJECT_DIR:-$PWD}/.venv/bin/activate" ] && run_cmd "source .venv/bin/activate" && run_cmd "clear"

  new_window "neovim"
  [ -f "${PROJECT_DIR:-$PWD}/.venv/bin/activate" ] && run_cmd "source .venv/bin/activate"
  run_cmd "nvim"

  new_window "claude code"
  run_cmd "claude --resume"

  select_window 1
fi

finalize_and_go_to_session

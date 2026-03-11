#!/usr/bin/env bash

DOTFILES="$(pwd)"
CONFIG_DIR="$HOME/.config"
found_any=false

for stow_config in "$DOTFILES"/*/.config/*/; do
    [[ -d "$stow_config" ]] || continue

    pkg_name=$(basename "$stow_config")
    live_dir="$CONFIG_DIR/$pkg_name"

    [[ -d "$live_dir" ]] || continue

    untracked=()
    while IFS= read -r -d '' live_file; do
        rel="${live_file#$live_dir/}"
        [[ -e "$stow_config/$rel" ]] || untracked+=("$rel")
    done < <(find "$live_dir" -mindepth 1 -not -type d -print0 2>/dev/null)

    if [[ ${#untracked[@]} -gt 0 ]]; then
        echo "~/.config/$pkg_name:"
        for f in "${untracked[@]}"; do
            echo "  + $f"
        done
        found_any=true
    fi
done

$found_any || echo "No untracked files found in any tracked .config packages."

#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"
REPO="$PWD"

# Files/dirs tracked in the repo that should NOT be symlinked into $HOME.
skip=(
  ".gitmodules"
  "link-files.sh"
  "update-vim-deps.sh"
)

is_skipped() {
  local f=$1
  for s in "${skip[@]}"; do
    [[ "$f" == "$s" ]] && return 0
  done
  return 1
}

while IFS= read -r f; do
  is_skipped "$f" && continue
  ln -sfnv "$REPO/$f" "$HOME/$f"
done < <(git ls-tree --name-only HEAD)

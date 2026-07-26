#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"
REPO="$PWD"

# Files/dirs tracked in the repo that should NOT be symlinked into $HOME.
skip=(
  ".gitmodules"
  "Brewfile"
  "bootstrap.sh"
  "fonts"
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

# Fonts: symlink each tracked font file into ~/Library/Fonts/
if [[ -d "$REPO/fonts" ]]; then
  mkdir -p "$HOME/Library/Fonts"
  while IFS= read -r font; do
    ln -sfnv "$REPO/$font" "$HOME/Library/Fonts/$(basename "$font")"
  done < <(git ls-tree -r --name-only HEAD fonts)
fi

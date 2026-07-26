#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"

git pull
git submodule update --init --recursive

cd .vim/pack/bundle/start
ls

for plugin in */; do
  (
    cd "$plugin"
    git checkout main 2>/dev/null || git checkout master
    git pull
    git submodule update --init --recursive
  )
done

python3 YouCompleteMe/install.py --all --verbose

cd -
git add .vim/pack/bundle/start
if ! git diff --cached --quiet; then
  git commit -m "Auto-update vim deps"
fi

#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"
REPO="$PWD"

echo "==> Installing Homebrew (skip if already installed)"
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "==> Installing brew packages from Brewfile"
brew bundle --file="$REPO/Brewfile"

echo "==> Enabling Touch ID for sudo"
SUDO_LOCAL=/etc/pam.d/sudo_local
if ! grep -qE '^auth[[:space:]]+sufficient[[:space:]]+pam_tid\.so' "$SUDO_LOCAL" 2>/dev/null; then
  echo 'auth       sufficient     pam_tid.so' | sudo tee -a "$SUDO_LOCAL" >/dev/null
fi

echo "==> Wiring OpenJDK into macOS system Java discovery"
JDK_LINK="/Library/Java/JavaVirtualMachines/openjdk.jdk"
if [[ ! -L "$JDK_LINK" ]]; then
  sudo ln -sfn "$HOMEBREW_PREFIX/opt/openjdk/libexec/openjdk.jdk" "$JDK_LINK"
fi

echo "==> Installing oh-my-zsh (skip if already installed)"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "==> Linking dotfiles into \$HOME"
"$REPO/link-files.sh"

echo "==> Cloning vim plugin submodules and building YCM"
git submodule update --init --recursive
"$REPO/update-vim-deps.sh"

echo "==> Bootstrap complete."
echo "Manual follow-ups:"
echo "  - Set iTerm2 preferences custom folder to \$HOME"

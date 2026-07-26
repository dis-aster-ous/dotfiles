eval "$(/opt/homebrew/bin/brew shellenv)"

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git brew asdf)

source $ZSH/oh-my-zsh.sh

set -o vi
export GPG_TTY=$(tty)

eval $(thefuck --alias)

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# pnpm
export PNPM_HOME="/Users/aster/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

update-vim-deps() {
  ~/dotfiles/update-vim-deps.sh "$@"
}

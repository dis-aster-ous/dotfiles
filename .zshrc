eval "$(/opt/homebrew/bin/brew shellenv)"

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git asdf)

source $ZSH/oh-my-zsh.sh

set -o vi
export GPG_TTY=$(tty)

eval $(thefuck --alias)

# pnpm
export PNPM_HOME="/Users/aster/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

alias bubu='brew update && brew upgrade && brew cleanup && brew autoremove'

update-vim-deps() {
  ~/dotfiles/update-vim-deps.sh "$@"
}

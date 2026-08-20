## Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

## oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git asdf)
source $ZSH/oh-my-zsh.sh

## Shell options
set -o vi
export GPG_TTY=$(tty)

## Tool integrations
# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="$HOME/.local/bin:$PATH"

## Aliases & functions
alias bubu='brew update && brew upgrade --greedy && brew cleanup && brew autoremove'

update-vim-deps() {
  ~/dotfiles/update-vim-deps.sh "$@"
}

# Bootstrap dependencies for aster's dotfiles.
# Run `brew bundle` from this directory to install everything.
#
# Post-install (needed for Java system discovery, required by YCM's jdt.ls):
#   sudo ln -sfn $HOMEBREW_PREFIX/opt/openjdk/libexec/openjdk.jdk \
#     /Library/Java/JavaVirtualMachines/openjdk.jdk
#
# Not covered by this Brewfile (install manually):
#   - Homebrew itself:      https://brew.sh
#   - oh-my-zsh:            https://ohmyz.sh
#   - GnuPG:                brew install gnupg (for GPG_TTY commit signing)
#   - Powerline / Nerd font (configured in iTerm settings)

# Core shell tooling
brew "git"
brew "vim"

# Version manager
brew "asdf"

# System-wide scripting languages (versions are managed by asdf for projects;
# these give us a recent stable executable on PATH for one-off scripting)
brew "python"
brew "node"
brew "go"

# Vim: YouCompleteMe build + tagbar dependencies
brew "cmake"
brew "universal-ctags"

# Vim: YouCompleteMe --all language completers (in addition to node/go/python above)
brew "mono"
brew "openjdk"

# Terminal
cask "iterm2"

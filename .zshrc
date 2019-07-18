# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh_reload)

source $ZSH/oh-my-zsh.sh

alias fucking=sudo
alias git=hub
alias rrsync='rsync -a --progress --delete-before'
alias dockrun='docker-compose run web'
alias dockrake='dockrun rake'

set -o vi
export GPG_TTY=$(tty)
export ANDROID_HOME=/usr/local/share/android-sdk
export JAVA_HOME=`/usr/libexec/java_home`
export PATH=./.git/safe/../../bin:/usr/local/sbin:$PATH:$JAVA_HOME/bin:$HOME/Library/Python/3.6/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"
export PYTHON_CONFIGURE_OPTS="--enable-framework"

eval $(thefuck --alias)
eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(pyenv init -)"

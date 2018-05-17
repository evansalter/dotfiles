# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="refined"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, vi-mode)

# User configuration

export PATH="$HOME/google-cloud-sdk:$HOME/google-cloud-sdk/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

source $HOME/.aliases

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
export PYTHONPATH=/Library/Python/2.7/site-packages/:$PYTHONPATH

eval $(thefuck --alias)

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOROOT/bin:$PATH


[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

source ~/dotfiles/zsh-history-substring-search/zsh-history-substring-search.zsh
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export JAVA_HOME=$(/usr/libexec/java_home)

# added by travis gem
[ -f /Users/Vendasta/.travis/travis.sh ] && source /Users/Vendasta/.travis/travis.sh

# added by travis gem
[ -f /Users/evansalter/.travis/travis.sh ] && source /Users/evansalter/.travis/travis.sh

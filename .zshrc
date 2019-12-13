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

export EDITOR=/usr/bin/vim
export PYTHONPATH=/Library/Python/2.7/site-packages/:$PYTHONPATH

eval $(thefuck --alias)

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$GOROOT/bin:$PATH


[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

source ~/dotfiles/zsh-history-substring-search/zsh-history-substring-search.zsh
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export JAVA_HOME=$(/usr/libexec/java_home)

# added by travis gem
[ -f /Users/evansalter/.travis/travis.sh ] && source /Users/evansalter/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ESalter/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/ESalter/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ESalter/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/ESalter/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH="/Users/ESalter/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/ESalter/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/ESalter/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/ESalter/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/ESalter/perl5"; export PERL_MM_OPT;

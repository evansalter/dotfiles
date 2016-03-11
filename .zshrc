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
plugins=(git, vi-mode)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
source /usr/local/bin/virtualenvwrapper.sh
# export MANPATH="/usr/local/man:$MANPATH"

# rbenv
eval "$(rbenv init -)"

source $ZSH/oh-my-zsh.sh

source $HOME/.aliases

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

# Powerline
function _update_ps1()
{
	export PROMPT="$(~/.zsh_plugins/powerline-zsh/powerline-zsh.py $?)"
}
precmd()
{
	_update_ps1
}

# PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

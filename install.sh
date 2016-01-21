#!/bin/sh

if [ ! ~/dotfiles/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/dotfiles/.vim/bundle/Vundle.vim
fi

if [ ! -d ~/dotfiles/.tmux ]; then
	git clone https://github.com/tmux-plugins/tpm ~/dotfiles/.tmux/plugins/tpm
fi

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.tmux ~/.tmux

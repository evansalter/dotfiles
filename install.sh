#!/bin/sh

install_brew() {
        read resp
        if [$resp = "y" ]; then
                /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
                BREW=1
        else
                printf "Skipping Brew.\n"
                BREW=0
        fi
}

install_vim() {
        read resp
        if [ $resp = "y" ]; then
                printf "Installing Vim...\n"
                sudo chown -R $USER /usr/local/Cellar
                brew install macvim --override-system-vim
                brew linkapps
        else
                printf "Skipping Vim.\n"
        fi
}

if [ `uname` = "Darwin" ]; then
        printf "Mac detected.\n"
        printf "Checking if Brew is installed..."
        if [ `which brew >/dev/null 2>/dev/null && echo $?` -eq 0 ]; then
                printf "Yup!\n"
                BREW=1
        else
                printf "Nope!  Would you like to install it? [y/n]"
                install_brew
        fi

        printf "Checking Vim version..."
        VIM_VER=`vim --version | head -n 1 | sed 's/[^0-9.]*\([0-9.]*\).*/\1/'`
        printf "%s\n" "$VIM_VER"
        if [ ! `echo $VIM_VER '<' 7.4 | bc -l` ]; then
                if [ $BREW ]; then
                        printf "Would you like to install Vim version 7.4+? [y/n]"
                        install_vim
                else
                        printf "Brew is required to install Vim 7.4+, would you like to install? [y/n]"
                        install_brew
                        if [ $BREW ]; then
                                printf "Would you like to install Vim version 7.4+? [y/n]"
                                install_vim
                        else
                                printf "Skipping Vim.\n"
                        fi
                fi
        fi
fi

printf "Checking if Vim-Plug is installed..."
if [ ! -f ~/dotfiles/.vim/autoload/plug.vim ]; then
        printf "Nope!\nInstalling Vim-Plug..."
        curl -fLo ~/dotfiles/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        printf "Done!\n"
else
        printf "Yup!\n"
fi

printf "Checking for leftover Vundle plugins..."
if [ -d ~/dotfiles/.vim/bundle ]; then
        rm -rf ~/dotfiles/vim/bundle
        printf "Deleted!\n"
else
        printf "None found!\n"
fi

printf "Checking if TPM is installed..."
if [ ! -d ~/dotfiles/.tmux ]; then
        printf "Nope!\nInstalling TPM..."
        git clone https://github.com/tmux-plugins/tpm ~/dotfiles/.tmux/plugins/tpm
        printf "Done!\n"
else
        printf "Yup!\n"
fi

printf "Linking .vimrc...\n"
ln -sf ~/dotfiles/.vimrc ~/.vimrc
printf "Linking .vim/...\n"
ln -sf ~/dotfiles/.vim ~/.vim
printf "Installing Vim-Plug plugins...\n"
vim +PlugInstall +qall
printf "Linking .tmux.conf...\n"
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
printf "Linking .tmux/...\n"
ln -sf ~/dotfiles/.tmux ~/.tmux
printf "Installing tmux plugins...\n"
~/.tmux/plugins/tpm/bin/install_plugins
printf "Linking .tmux-powerlinerc...\n"
ln -sf ~/dotfiles/.tmux-powerlinerc ~/.tmux-powerlinerc
printf "Linking .tmux-powerline-theme...\n"
ln -sf ~/dotfiles/tmux-powerline-theme.sh ~/.tmux/plugins/tmux-powerline/themes/tmux-powerline-theme.sh


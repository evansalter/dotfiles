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
                brew install macvim --with-override-system-vim
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
        if [ `echo $VIM_VER '<' 7.4 | bc -l` ]; then
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
        if [ $BREW ]; then
                printf "Installing Mackup...\n"
                brew install mackup
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

printf "Checking if Oh-My-ZSH is installed..."
if [ ! -d ~/.oh-my-zsh ]; then
        printf "Nope!\nInstalling Oh-My-ZSH..."
        git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
        chsh -s /bin/zsh
        printf "Done!\n"
else
        printf "Yup!\n"
fi

printf "Checking if .zshrc_base is sourced in ~/.zshrc..."
if grep 'source ~/dotfiles/.zshrc_base' ~/.zshrc; then
        printf "Yup!\n"
else
        printf "Nope!\nAdding .zshrc_base to ~/.zshrc\n"
        echo "source ~/dotfiles/.zshrc_base" >> ~/.zshrc
fi

printf "Linking .zsh_plugins...\n"
ln -sfF ~/dotfiles/.zsh_plugins/ ~/.zsh_plugins
printf "Linking .vimrc...\n"
ln -sf ~/dotfiles/.vimrc ~/.vimrc
printf "Linking .vim/...\n"
ln -sfF ~/dotfiles/.vim ~/.vim
printf "Linking .aliases...\n"
ln -sf ~/dotfiles/.aliases ~/.aliases
printf "Installing Vim-Plug plugins...\n"
vim +PlugInstall +qall
printf "Linking .mackup.cfg...\n"
ln -sf ~/dotfiles/.mackup.cfg ~/.mackup.cfg

printf "\n\nTo restore Mackup configuration, run 'mackup restore'\n"

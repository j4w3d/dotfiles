#!/bin/bash


## Install fonts

cp ./fonts/*  $HOME/Library/Fonts

## Install brew
brew_version=`brew -v`
if [ $? -ne '0' ]
then
    echo "installing brew"
    sudo /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo $brew_version
fi


## rcup for dotfile management
rcup_version=`rcup -V`
if [ $? -ne '0' ]
then
    echo "installing rcm"
    brew tap thoughtbot/formulae
    brew install rcm
else
    echo $rcup_version
fi


## Install oh-my-zsh
if [ -d ~/.oh-my-zsh ]
then
    echo "ohmyzsh found. skipping"
else
    echo "installing ohmyZSH..."
    sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

## Install virtualenv
virtualenv_version=`virtualenv --version`
if [ $? -ne '0' ]
then
    echo "installing virtualenv: sudo pip install virtualenvwrapper --upgrade --ignore-installed six"
    sudo pip install virtualenvwrapper --upgrade --ignore-installed six
else
    echo "virtualenv:" $virtualenv_version
fi

chsh -s /bin/zsh


## Install rbenv

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

rbenv_version=`rbenv --version`
if [ $? -ne '0' ]
then
    echo "installing rbenv"
    brew update
    brew install rbenv
    rbenv install 2.3.1
    rbenv global 2.3.1
    rbenv rehash
    gem install bundler

else
    echo "updating rbenv"
    brew upgrade rbenv ruby-build
    echo "rbenv: " $rbenv_version
fi



## Install gvm

gvm_version=`gvm version`
if [ $? -ne '0' ]
then
    echo "installing gvm"
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    source ~/.gvm/scripts/gvm
    xcode-select --install
    brew update
    brew install mercurial
    gvm install go1.4 -B
    gvm use go1.4 
    gvm install go1.6.3
    gvm use go1.6.3

else
    echo "gvm: " $gvm_version
fi


## Install nvm

nvm_version=`nvm --version`
if [ $? -ne '0' ]
then
    echo "installing nvm"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    nvm install --lts
    nvm use --lts
else
    echo "nvm: " $nvm_version
    echo "node" `node --version`
fi




### Extras

echo "python linting tool: flake8"
echo "Read more hre: https://github.com/nvie/vim-flake8"
pip install flake8


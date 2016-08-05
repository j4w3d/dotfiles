#!/bin/bash

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
    echo "rbenv:" $rbenv_version
fi



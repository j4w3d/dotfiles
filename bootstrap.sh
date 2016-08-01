#!/bin/bash
brew_version=`brew -v`
if [ $? -ne '0' ]
then
    echo "installing brew"
    sudo /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo $brew_version
fi

rcup_version=`rcup -V`
if [ $? -ne '0' ]
then
    echo "installing rcm"
    brew tap thoughtbot/formulae
    brew install rcm
else
    echo $rcup_version
fi

if [ -d ~/.oh-my-zsh ]
then
    echo "ohmyzsh found. skipping"
else
    echo "installing ohmyZSH..."
    sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi



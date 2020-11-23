#!/bin/zsh
set -xu

# Command Line Tools
echo -e "\e[36;1mCommand Line Tools for Xcode install\e[m"
xcode-select --install

# homebrew
echo -e "\e[36;1mInstalling homebrew...\e[m"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo -e "\e[36;1mRun brew doctor...\e[m"
brew doctor

echo -e "\e[36;1mRun brew update...\e[m"
brew update

echo -e "\e[32;1mComplete homebrew install!\e[m"
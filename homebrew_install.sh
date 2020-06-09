#先にApp storeにログインしておく

# 蒸しファイルを可視化する（再起動したら見える）
defaults write com.apple.finder AppleShowAllFiles TRUE

# Command Line Tools
echo "Command Line Tools for Xcode install"
xcode-select --install

# homebrew
echo "installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "run brew doctor..."
brew doctor

echo "run brew update..."
brew update

echo "Complete homebrew install"

echo "installing Brewfile..."
brew bundle

echo "Complete Brewfile install"
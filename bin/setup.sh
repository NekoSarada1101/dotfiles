#!/bin/zsh
set -xeu

echo -e "\e[36;1mStart setup...\e[m"

# dotfilesディレクトリにある、ドットから始まり2文字以上の名前のファイルに対して
echo -e "\e[36;1mCreate a symbolic link.\e[m"
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".require_oh-my-zsh" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    [ "$f" = ".gitignore" ] && continue

    # シンボリックリンクを貼る
    ln -snfv ${PWD}/"$f" ~/
done

# 隠しファイルを可視化する（再起動したら見える）
defaults write com.apple.finder AppleShowAllFiles TRUE

echo -e "\e[32;1mComplete setup!\e[m"

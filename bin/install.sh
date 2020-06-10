#!/bin/zsh
set -xeu

echo -e "\e[36;1mstart setup...\e[m"

# dotfilesディレクトリにある、ドットから始まり2文字以上の名前のファイルに対して
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".require_oh-my-zsh" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    [ "$f" = ".gitignore" ] && continue

    # シンボリックリンクを貼る
    ln -snfv ${PWD}/"$f" ~/
done

# prezto install
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
   [ "$rcfile" = "${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc" ] && continue

   ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo -e "\e[33;1mComplete!\e[m"

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

########################################

# Customize to your needs...

# 少し凝った zshrc
# License : MIT
# http://mollifier.mit-license.org/

# 環境変数
export LANG=ja_JP.UTF-8


# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob


########################################
# エイリアス

# ls系
alias ls='exa'
alias ll='exa -alh'
alias lT='exa -T'
alias laT='exa -aT'

alias ka='k -a'

# cd系
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias icloud='cd Library/Mobile\ Documents/com\~apple\~CloudDocs'

# git系
alias g='git'
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gco='git checkout'
alias gpl='git pull'
alias gc='git commit'

# cat系
alias cat='bat'

# mkdir系
alias mkdir='mkdir -p'

# open系
alias op='open'

# 安全策
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# 普段は使わない
# alias sl='sl'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi


########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='exa -FG' #ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

# vim:set ft=zsh:


########################################
# PATH
# zsh-completions
fpath=(path/to/zsh-completions/src $fpath)

export PATH=/usr/local/bin:$PATHexport PATH="/usr/local/opt/sqlite/bin:$PATH"

export PATH=$HOME/.nodebrew/current/bin:$PATH

# starship
eval "$(starship init zsh)"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"


########################################
# zinit
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk


# 補完を更に強化する
# pacman や yaourt のパッケージリストも補完するようになる
zinit light "zsh-users/zsh-completions"

# 補完
zinit light zsh-users/zsh-autosuggestions

# シンタックスハイライト
zinit light zdharma/fast-syntax-highlighting

# anyframeのセットアップ
zinit light mollifier/anyframe

# Ctrl+u
# peco でディレクトリの移動履歴を表示
bindkey '^u' anyframe-widget-cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# Ctrl+r
# peco でコマンドの実行履歴を表示
bindkey '^r' anyframe-widget-execute-history

# Ctrl+b
# peco でGitブランチを表示して切替え
bindkey '^b' anyframe-widget-checkout-git-branch

# Gitの変更状態がわかる ls。ls の代わりにコマンド `k` を実行するだけ。
zinit light supercrabtree/k

# 作業中のGitのルートディレクトリまでジャンプするコマンドを定義するプラグインです。
# cd-gitroot コマンドをエイリアスで U に割り当てています。
zinit light 'mollifier/cd-gitroot'

# コマンド入力途中で上下キー押したときの過去履歴がいい感じに出るようになる
zinit light "zsh-users/zsh-history-substring-search"

# 256色表示にする
zinit light "zsh-users/zsh-completions"

# prezto
# cdのディレクトリ保管の背景色表示
zinit snippet PZT::modules/utility/init.zsh
zinit snippet PZT::modules/completion/init.zsh

zinit snippet PZT::modules/directory/init.zsh

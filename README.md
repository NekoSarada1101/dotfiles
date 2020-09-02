![macos](https://github.com/Sarada1101/dotfiles/workflows/macos/badge.svg)

# dotfiles

1. mas を使うために App Store にログインしておく

2. 旧 PC から.ssh ファイルを新 PC に移す

3. dotfiles リポジトリを clone する

```
cd ~
git clone git@github.com:Sarada1101/dotfiles.git
```

4. install.sh を実行しシンボリックリンクを貼る

```
dotfiles/install.sh
```

5. homebrew_install.sh を実行し、homebrew パッケージなどをインストールする

```
dotfiles/homebrew_install.sh
```

6. brew bundle で Brewfile を読み込む

```
cd dotfiles
brew bundle
```

7. [brewlet をインストール](https://github.com/zkokaja/Brewlet)

8. [PhishWall クライアントをインストール](https://www.securebrain.co.jp/products/phishwall/install_mac.html)

9. [カスペルキーのセットアップ](https://home.kaspersky.co.jp/store/kasperjp/DisplayHomePage?icid=jp_ng-thmb_pro_ona_oth__onl_b2c__buttn_______)

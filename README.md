# dotfiles
## 使い方
使いたいのがあったらいい感じにシンボリックリンク貼る
```
$ ln -s ~/dotfiles/_zshrc ~/.zshrc
```

## 環境を整えるためのコマンド
完全に自分のためです

### zsh
```
$ cat /etc/shells
if `/bin/zsh` is exist
$ chsh -s /bin/zsh
```
参考
* http://mollifier.hatenablog.com/entry/2013/02/22/025415

### NeoBundle
`/bundle/`にいれるのは古いのだろうか
```
$ mkdir -p ~/.vim/bundle
$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```
参考
* http://qiita.com/Kuchitama/items/68b6b5d5ed40f6f96310

### anyenv
```
$ git clone https://github.com/riywo/anyenv ~/.anyenv
```
参考
* http://qiita.com/luckypool/items/f1e756e9d3e9786ad9ea

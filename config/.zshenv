# PATH 設定
path=(
  /bin
  /sbin
  /usr/bin
  /usr/sbin
  /usr/local/bin
  /usr/local/sbin
  /usr/local/git/bin(N-/)
  /opt/homebrew/bin
  ~/bin
  ~/.anyenv/bin(N-/)
  ~/.go/bin(N-/)
  ~/dotfiles/bin(N-/)
  ~/flutter/bin
  $path
)

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# エディタ
export EDITOR=/usr/bin/vim

# homebrew
export HOMEBREW_INSTALL_CLEANUP=1

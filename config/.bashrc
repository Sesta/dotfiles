# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

#takedas setting
alias vi="vim"
alias gco="git checkout"
alias gst="git status"
alias gdf="git diff"
alias gbr="git branch"
alias glg="git log --graph --oneline --color"

source ~/.git-completion.bash
source ~/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true
# add されていない変更の存在を「＊」で示す
# commit されていない変更の存在を「＋」で示す
GIT_PS1_SHOWUNTRACKEDFILES=true
# add されていない新規ファイルの存在を「％」で示す
GIT_PS1_SHOWSTASHSTATE=true
# stash がある場合は「＄」で示す

export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '

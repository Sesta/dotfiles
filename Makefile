.DEFAULT_GOAL := help

# TODO: setup済みなら実行しないようにする
setup-all: ## 全てsetupする
	make setup-zsh
	make setup-git
	make setup-brew
	make setup-tmux
	make setup-anyenv
	make setup-vim

# TODO: zshがない場合も考慮する
setup-zsh: ## zsh-setup
	chsh -s /bin/zsh
	# 参考: http://mollifier.hatenablog.com/entry/2013/02/22/025415
	ln -s ~/dotfiles/config/.zshenv ~/.zshenv
	ln -s ~/dotfiles/config/.zprofile ~/.zprofile
	ln -s ~/dotfiles/config/.zshrc ~/.zshrc
	exec $$SHELL -l

# TODO: ~/にdotfilesを置いてなくてもいい感じに動くようにする
setup-git: ## gitのsetup
	ln -s ~/dotfiles/config/.gitignore_global ~/.gitignore_global
	ln -s ~/dotfiles/config/.gitconfig ~/.gitconfig

setup-brew: ## brewのsetupして特殊な設定がいらないtoolたちをinstall
	// 失敗しがちなのでpkgをダウンロードしたほうが良いかも
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install tree
	brew install direnv
	# direnvの参考: https://qiita.com/kompiro/items/5fc46089247a56243a62

setup-tmux: ## tmuxのsetup
	brew install tmux
	ln -s ~/dotfiles/config/.tmux.conf ~/.tmux.conf

setup-anyenv: ## anyenvのsetup
	git clone https://github.com/riywo/anyenv ~/.anyenv
	# 参考: http://qiita.com/luckypool/items/f1e756e9d3e9786ad9ea

setup-vim: ## vimのsetup
	ln -s ~/dotfiles/config/.vimrc ~/.vimrc
	mkdir -p ~/.vim/bundle
	git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
	# 参考: http://qiita.com/Kuchitama/items/68b6b5d5ed40f6f96310

setup-bashrc: ## bashのsetup
	ln -s ~/dotfiles/config/.bashrc ~/.bashrc
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash
	chmod a+x ~/.git-completion.bash
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh
	chmod a+x ~/.git-prompt.sh
	# 参考: https://qiita.com/varmil/items/9b0aeafa85975474e9b6
	# curlに変えてるけど多分動く

.PHONY: help
help:
	@grep -E '^[a-z0-9A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

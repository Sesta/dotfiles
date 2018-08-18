.DEFAULT_GOAL := help

# TODO: setup済みなら実行しないようにする
setup-all: ## 全てsetupする
	make setup-zsh
	make setup-git
	make setup-brew
	make setup-tmux
	make setup-anyenv
	make setup-vim

setup-brew: ## brewのsetup
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# TOOD: ~/にdotfilesを置いてなくてもいい感じに動くようにする
setup-git: ## gitのsetup
	ln -s ~/dotfiles/_gitignore_global ~/.gitignore_global
	ln -s ~/dotfiles/_gitconfig ~/.gitconfig

# TODO: zshがない場合も考慮する
setup-zsh: ## zsh-setup
	chsh -s /bin/zsh
	ln -s ~/dotfiles/_zshrc ~/.zshrc
	ln -s ~/dotfiles/_zshenv ~/.zshenv
	exec $SHELL -l

setup-tmux: ## tmuxのsetup
	brew install tmux
	ln -s ~/dotfiles/_tmux.conf ~/.tmux.conf

setup-anyenv: ## anyenvのsetup
	git clone https://github.com/riywo/anyenv ~/.anyenv
	ln -s ~/dotfiles/_zprofile ~/.zprofile

setup-vim: ## vimのsetup
	ln -s ~/dotfiles/_vimrc ~/.vimrc
	mkdir -p ~/.vim/bundle
	git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

.PHONY: help
help:
	@grep -E '^[a-z0-9A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

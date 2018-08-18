.DEFAULT_GOAL := help

# TODO: setup済みなら実行しないようにする
setup-all: ## 全てsetupする
	make setup-vim

setup-vim: ## vimのsetup
	ln -s ~/dotfiles/_vimrc ~/.vimrc
	mkdir -p ~/.vim/bundle
	git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

.PHONY: help
help:
	@grep -E '^[a-z0-9A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

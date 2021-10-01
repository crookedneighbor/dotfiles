.PHONY: all link brew brew-cli brew-apps

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: link brew

link:
	rm -f ~/.gitconfig && ln -s $(ROOT_DIR)/git/gitconfig ~/.gitconfig
	rm -f ~/.gitignore_global && ln -s $(ROOT_DIR)/git/gitignore_global ~/.gitignore_global
	rm -f ~/.nvmrc && ln -s $(ROOT_DIR)/node/nvmrc ~/.nvmrc
	rm -f ~/.tmux.conf && ln -s $(ROOT_DIR)/tmux/tmux.conf ~/.tmux.conf
	rm -f ~/.vimrc && ln -s $(ROOT_DIR)/vim/vimrc ~/.vimrc
	rm -rf ~/.vim && mkdir -p ~/.vim && ln -s $(ROOT_DIR)/vim/customizations ~/.vim/customizations
	rm -f ~/.zshrc && ln -s $(ROOT_DIR)/zsh/zshrc ~/.zshrc
	rm -f ~/.zprofile && ln -s $(ROOT_DIR)/zsh/zprofile ~/.zprofile
	rm -rf ~/.zsh && mkdir -p ~/.zsh && ln -s $(ROOT_DIR)/zsh/source ~/.zsh/source && ln -s $(ROOT_DIR)/zsh/themes ~/.zsh/themes

brew: brew-cli brew-apps

brew-cli:
	brew install git
	brew install tmux
	brew install tig
	brew install rbenv
	brew install nvm
	brew install zsh-history-substring-search
	brew install zsh-syntax-highlighting

brew-apps:
ifeq (,$(wildcard /Applications/Discord.app))
	brew install --cask discord
else
	echo "Discord already installed. Skipping brew install --cask discord"
endif
ifeq (,$(wildcard /Applications/ShiftIt.app))
	brew install --cask shiftit
else
	echo "Shiftit already installed. Skipping brew install --cask shiftit"
endif
ifeq (,$(wildcard /Applications/iTerm.app))
	brew install --cask iterm2
else
	echo "iTerm2 already installed. Skipping brew install --cask iterm2"
endif
ifeq (,$(wildcard /Applications/Spotify.app))
	brew install --cask spotify
else
	echo "Spotify already installed. Skipping brew install --cask spotify"
endif
ifeq (,$(wildcard /Applications/Docker.app))
	brew install --cask docker
else
	echo "Docker already installed. Skipping brew install --cask docker"
endif
ifeq (,$(wildcard /Applications/Skitch.app))
	brew install --cask skitch
else
	echo "Skitch already installed. Skipping brew install --cask skitch"
endif
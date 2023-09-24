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

brew: brew-cli brew-apps brew-personal-apps

CLI_APPS = git \
	tmux \
	tig \
	rbenv \
	nvm \
	zsh-history-substring-search \
	zsh-syntax-highlighting

DESKTOP_APPS = google-chrome \
	visual-studio-code \
	caffeine \
	shiftit \
	iterm2 \
	notion \
	spotify \
	todoist \
	docker \
	skitch

PERSONAL_DESKTOP_APPS = discord \
	reaper \
	steam

brew-cli:
	for app in $(CLI_APPS); do \
		brew install $$app ; \
	done

brew-apps:
	for app in $(DESKTOP_APPS); do \
		brew install --cask $$app ; \
	done

brew-personal-apps:
	@read -p "Do you want to install optional applications (Discord/Steam/Reaper)? [y/N] " ans && ans=$${ans:-N} ; \
	if [ $${ans} = y ] || [ $${ans} = Y ]; then \
		for app in $(PERSONAL_DESKTOP_APPS); do \
			brew install --cask $$app ; \
		done \
	else \
		printf "Skipping personal app installation." ; \
	fi
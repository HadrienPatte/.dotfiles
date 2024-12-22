install: diff
	cp zshrc ~/.zshrc
	cp p10k.zsh ~/.p10k.zsh
	cp aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
	cp gitconfig ~/.gitconfig
	cp gitconfig-mac ~/.gitconfig-mac
	cp gitconfig-linux ~/.gitconfig-linux
	mkdir -p ~/.SpaceVim.d/autoload
	cp spacevim-init.toml ~/.SpaceVim.d/init.toml
	cp myspacevim.vim ~/.SpaceVim.d/autoload/myspacevim.vim
	mkdir -p ~/.terraform.d/plugin-cache
	cp terraformrc ~/.terraformrc

diff:
	-diff zshrc ~/.zshrc
	-diff p10k.zsh ~/.p10k.zsh
	-diff aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
	-diff gitconfig ~/.gitconfig
	-diff gitconfig-mac ~/.gitconfig-mac
	-diff gitconfig-linux ~/.gitconfig-linux
	-diff spacevim-init.toml ~/.SpaceVim.d/init.toml
	-diff myspacevim.vim ~/.SpaceVim.d/autoload/myspacevim.vim
	-diff terraformrc ~/.terraformrc

deps: oh-my-zsh powerlevel10k zsh-autosuggestions zsh-syntax-highlighting spacevim

oh-my-zsh:
ifeq (,$(wildcard ~/.oh-my-zsh))
	@echo "Install $@"
	@git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
else
	@echo "Update $@"
	@cd ~/.oh-my-zsh && git fetch && git pull
endif
	@echo

powerlevel10k:
ifeq (,$(wildcard ~/.oh-my-zsh/custom/themes/powerlevel10k))
	@echo "Install $@"
	@git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
else
	@echo "Update $@"
	@cd ~/.oh-my-zsh/custom/themes/powerlevel10k && git fetch && git pull
endif
	@echo

zsh-autosuggestions:
ifeq (,$(wildcard ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions))
	@echo "Install $@"
	@git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
	@echo "Update $@"
	@cd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && git fetch && git pull
endif
	@echo

zsh-syntax-highlighting:
ifeq (,$(wildcard ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting))
	@echo "Install $@"
	@git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
else
	@echo "Update $@"
	@cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && git fetch && git pull
endif
	@echo

spacevim:
ifeq (,$(wildcard ~/.SpaceVim))
	@echo "Install $@"
	@curl -sLf https://spacevim.org/install.sh | bash
else
	@echo "Update $@"
	@cd ~/.SpaceVim && git fetch && git pull
endif
	@echo

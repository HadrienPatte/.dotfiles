install: diff
	cp zshrc ~/.zshrc
	cp p10k.zsh ~/.p10k.zsh
	cp aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
	cp gitconfig ~/.gitconfig
	cp gitconfig-mac ~/.gitconfig-mac
	cp gitconfig-linux ~/.gitconfig-linux
	cp lvim.config.lua ~/.config/lvim/config.lua
	cp ghostty.ini ~/.config/ghostty/config
	mkdir -p ~/.terraform.d/plugin-cache
	cp terraformrc ~/.terraformrc

diff:
	-diff zshrc ~/.zshrc
	-diff p10k.zsh ~/.p10k.zsh
	-diff aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
	-diff gitconfig ~/.gitconfig
	-diff gitconfig-mac ~/.gitconfig-mac
	-diff gitconfig-linux ~/.gitconfig-linux
	-diff lvim.config.lua ~/.config/lvim/config.lua
	-diff ghostty.ini ~/.config/ghostty/config
	-diff terraformrc ~/.terraformrc

deps: oh-my-zsh powerlevel10k zsh-autosuggestions zsh-syntax-highlighting lunarvim

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

lunarvim:
ifeq (,$(wildcard ~/.local/share/lunarvim/lvim))
	@echo "Install $@"
	@bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
else
	@echo "Update $@"
	@cd ~/.local/share/lunarvim/lvim && git fetch && git pull
endif
	@echo

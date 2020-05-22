install:
	cp zshrc ~/.zshrc
	cp fasdrc ~/.fasdrc
	cp p10k.zsh ~/.p10k.zsh
	cp aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
	cp iterm2_shell_integration.zsh ~/.iterm2_shell_integration.zsh
	cp gitconfig ~/.gitconfig
	cp gitconfig-mac ~/.gitconfig-mac
	cp gitconfig-linux ~/.gitconfig-linux

deps: oh-my-zsh powerlevel10k

oh-my-zsh:
	@git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

powerlevel10k:
	@git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

install:
	cp zshrc ~/.zshrc
	cp fasdrc ~/.fasdrc
	cp p10k.zsh ~/.p10k.zsh
	cp iterm2_shell_integration.zsh ~/.iterm2_shell_integration.zsh

deps: oh-my-zsh powerlevel10k

oh-my-zsh:
	@git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

powerlevel10k:
	@git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

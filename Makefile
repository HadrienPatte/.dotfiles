install:
	cp zshrc ~/.zshrc
	cp fasdrc ~/.fasdrc

deps: oh-my-zsh

oh-my-zsh:
	@git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

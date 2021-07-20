install:
	cp zshrc ~/.zshrc
	cp fasdrc ~/.fasdrc
	cp p10k.zsh ~/.p10k.zsh
	cp aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
	cp iterm2_shell_integration.zsh ~/.iterm2_shell_integration.zsh
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
	-diff fasdrc ~/.fasdrc
	-diff p10k.zsh ~/.p10k.zsh
	-diff aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
	-diff iterm2_shell_integration.zsh ~/.iterm2_shell_integration.zsh
	-diff gitconfig ~/.gitconfig
	-diff gitconfig-mac ~/.gitconfig-mac
	-diff gitconfig-linux ~/.gitconfig-linux
	-diff spacevim-init.toml ~/.SpaceVim.d/init.toml
	-diff myspacevim.vim ~/.SpaceVim.d/autoload/myspacevim.vim
	-diff terraformrc ~/.terraformrc

deps: oh-my-zsh powerlevel10k spacevim

oh-my-zsh:
	@git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

powerlevel10k:
	@git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

spacevim:
	@curl -sLf https://spacevim.org/install.sh | bash

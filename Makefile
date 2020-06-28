install:
	cp zshrc ~/.zshrc
	cp fasdrc ~/.fasdrc
	cp p10k.zsh ~/.p10k.zsh
	cp aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
	cp iterm2_shell_integration.zsh ~/.iterm2_shell_integration.zsh
	cp gitconfig ~/.gitconfig
	cp gitconfig-mac ~/.gitconfig-mac
	cp gitconfig-linux ~/.gitconfig-linux
	cp vimrc ~/.vimrc
	cp coc.vim ~/.coc.vim

diff:
	diff zshrc ~/.zshrc
	diff fasdrc ~/.fasdrc
	diff p10k.zsh ~/.p10k.zsh
	diff aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
	diff iterm2_shell_integration.zsh ~/.iterm2_shell_integration.zsh
	diff gitconfig ~/.gitconfig
	diff gitconfig-mac ~/.gitconfig-mac
	diff gitconfig-linux ~/.gitconfig-linux
	diff vimrc ~/.vimrc
	diff coc.vim ~/.coc.vim

deps: oh-my-zsh powerlevel10k vim-plugins

oh-my-zsh:
	@git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

powerlevel10k:
	@git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

vim-plugins: vim-nerdtree vim-nerdtree-git vim-indent-lint vim-gitgutter vim-coc

vim-nerdtree:
	@git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q

vim-nerdtree-git:
	@git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/pack/vendor/start/nerdtree-git-plugin

vim-indent-lint:
	@git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLint
	vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLint/doc" -c q

vim-gitgutter:
	@git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/pack/vendor/start/vim-gitgutter
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/vim-gitgutter/doc" -c q

vim-coc:
	@git clone --branch=release https://github.com/neoclide/coc.nvim.git ~/.vim/pack/vendor/start/coc.nvim
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/coc.nvim/doc" -c q

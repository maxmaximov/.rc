build:
	@git submodule init
	@git submodule update

install:
	@mkdir -p ~/.ssh
	@mkdir -p ~/.subversion
	@mkdir -p ~/.vim
	@ln -sf ~/rc/.ssh/config ~/.ssh
	@ln -sf ~/rc/.subversion/config ~/.subversion
	@ln -sF ~/rc/.vim/bundle ~/.vim/bundle
	@ln -sf ~/rc/.vim/filetype.vim ~/.vim/filetype.vim
	@ln -sf ~/rc/.gitconfig ~
	@ln -sf ~/rc/.vimrc ~
	@ln -sf ~/rc/.zshenv ~
	@ln -sf ~/rc/.zshrc ~

test:
	@echo Testing .zshenv...
	@zsh -n .zshenv
	@echo Testing .zshrc...
	@zsh -n .zshrc
	@echo Testing .gitconfig...
	@git config --list -f .gitconfig > /dev/null
	@echo Testing .ssh/config...
	@ssh -TF .ssh/config git@github.com 2>&1 | grep -iv 'bad configuration' > /dev/null
	@echo Testing .subversion/config...
	@svn status -q --config-dir .subversion

.PHONY: build install test

ifndef DESTDIR
export DESTDIR = ~
endif

build:
	@git submodule init
	@git submodule update

install:
	@mkdir -p $(DESTDIR)/.ssh
	@mkdir -p $(DESTDIR)/.subversion
	@mkdir -p $(DESTDIR)/.vim
	@ln -sf $(CURDIR)/ssh/config $(DESTDIR)/.ssh
	@ln -sf $(CURDIR)/subversion/config $(DESTDIR)/.subversion
	@ln -sF $(CURDIR)/vim/bundle $(DESTDIR)/.vim/bundle
	@ln -sf $(CURDIR)/vim/filetype.vim $(DESTDIR)/.vim/filetype.vim
	@ln -sf $(CURDIR)/gitconfig $(DESTDIR)/.gitconfig
	@ln -sf $(CURDIR)/vimrc $(DESTDIR)/.vimrc
	@ln -sf $(CURDIR)/zshenv $(DESTDIR)/.zshenv
	@ln -sf $(CURDIR)/zshrc $(DESTDIR)/.zshrc

test:
	@echo Testing zshenv...
	@zsh -n zshenv
	@echo Testing zshrc...
	@zsh -n zshrc
	@echo Testing gitconfig...
	@git config --list -f gitconfig > /dev/null
	@echo Testing ssh/config...
	@ssh -TF ssh/config git@github.com 2>&1 | grep -iv 'bad configuration' > /dev/null
	@echo Testing subversion/config...
	@svn status -q --config-dir subversion

clean:
	@git clean -dxf
	@git submodule deinit -f .

.PHONY: build install test clean

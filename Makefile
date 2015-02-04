ifndef DESTDIR
export DESTDIR = ~
endif

export RCDIR = $(DESTDIR)/..rc

build:
	@git submodule init
	@git submodule update --init --recursive

install:
	@chmod 400 ssh/config
	@rm -rf $(RCDIR)
	@ln -s $(CURDIR) $(RCDIR)
	@mkdir -p $(DESTDIR)/.ssh
	@mkdir -p $(DESTDIR)/.subversion
	@mkdir -p $(DESTDIR)/.vim
	@ln -sf $(CURDIR)/git/gitconfig $(DESTDIR)/.gitconfig
	@ln -sf $(CURDIR)/ssh/config $(DESTDIR)/.ssh
	@ln -sf $(CURDIR)/subversion/config $(DESTDIR)/.subversion
	@rm -rf $(DESTDIR)/.vim/bundle
	@ln -sf $(CURDIR)/vim/bundle $(DESTDIR)/.vim/bundle
	@ln -sf $(CURDIR)/vim/filetype.vim $(DESTDIR)/.vim/filetype.vim
	@ln -sf $(CURDIR)/vim/vimrc $(DESTDIR)/.vimrc
	@ln -sf $(CURDIR)/zsh/zshenv $(DESTDIR)/.zshenv
	@ln -sf $(CURDIR)/zsh/zshrc $(DESTDIR)/.zshrc

test:
	@echo Testing zsh/zshenv...
	@zsh -n zsh/zshenv
	@echo Testing zsh/zshrc...
	@zsh -n zsh/zshrc
	@echo Testing git/gitconfig...
	@git config --list -f git/gitconfig > /dev/null
	@echo Testing ssh/config...
	@ssh -TF ssh/config git@github.com 2>&1 | grep -iv 'bad configuration' > /dev/null
	@echo Testing subversion/config...
	@svn status -q --config-dir subversion

clean:
	@git clean -dxf
	@git submodule deinit -f .

.PHONY: build install test clean

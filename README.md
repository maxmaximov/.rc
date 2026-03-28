# .dotfiles

```bash
xcode-select --install
```

Wait until the installation finishes, then run:

```bash
git clone https://github.com/maxmaximov/.dotfiles.git ~/.dotfiles
~/.dotfiles/install
```

After 1Password SSH Agent is working, switch `origin` to SSH:

```bash
git -C ~/.dotfiles remote set-url origin git@github.com:maxmaximov/.dotfiles.git
```

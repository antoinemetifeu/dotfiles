# dotfiles

## How i setup this repo

```zsh
# Init a bare repo
git init --bare $HOME/.dotfiles
# add alias to shell configuration
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> $HOME/.zshrc
# Reload the shell setting
source ~/.zshrc
# Prevent untracked files from showing up when we call dotfiles status
dotfiles config --local status.showUntrackedFiles no
```

## How i use them

```zsh
dotfiles status
# add any dotfiles to repo
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles remote add origin git@github.com:antoinemetifeu/dotfiles.git
dotfiles push origin master
```

## How install dotfiles to another system

```zsh
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
# Add .dotfiles directory to .gitignore to prevent recursion issues
echo ".dotfiles" >> .gitignore
git clone --bare git@github.com:antoinemetifeu/dotfiles.git $HOME/.dotfiles
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```
If you already have configuration files with identical names, checkout will fail. Back up and remove those files. Skip back up if you don’t need them



## Keeping a list of explicitly installed packages

```
pacman -Qqe > ~/.pkglist
```

## To install packages from the list backup

```
pacman -S - < ~/.pkglist
```

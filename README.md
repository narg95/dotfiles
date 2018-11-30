# Installation 

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
git clone --bare git@gitlab.com:narg95/dotfiles.git $HOME/.cfg
config config --local status.showUntrackedFiles no 
config pull
```

# Sync file

```bash
config add $file
config commit -m "add $file"
```
e.g. `file=.vimrc`

# First time setup

```bash
git init --bare $HOME/.cfg 
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' 
config config --local status.showUntrackedFiles no 
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
```

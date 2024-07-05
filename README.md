# My dotfiles

template taken from https://www.atlassian.com/git/tutorials/dotfiles

## Install
Make sure all previous dotfiles are removed or backed up. Here are some quick steps:
```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

Add alias to `~/.bash_aliases`
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
Install
```
echo ".cfg" >> .gitignore
git clone --bare <git-repo-url> $HOME/.cfg
source ~/.bashrc
config checkout
config config --local status.showUntrackedFiles no
```

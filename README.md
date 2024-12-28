a collection of my dotfiles
to clone to a new machine using ssh:
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
git clone --bare git@github.com:BigSpaceships/dotfiles.git $HOME/.cfg
config checkout
```

using https:
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
git clone --bare https://github.com/BigSpaceships/dotfiles.git $HOME/.cfg
config checkout
```

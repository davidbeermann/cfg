# dotdotdot

Repository for Linux system configuration. Based on [this technique](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

## Setup on new machine

Ensure SSH configuration for GitHub is setup before!

```sh
mkdir ~/.dotdotdot
git clone --bare git@github.com:davidbeermann/dotdotdot.git ~/.dotdotdot
alias ddd='/usr/bin/git --git-dir=$HOME/.dotdotdot/ --work-tree=$HOME'
ddd checkout
ddd config --local --add user.name "David Beermann"
ddd config --local --add user.email "mail@davidbeermann.com"
```
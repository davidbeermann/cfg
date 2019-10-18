# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# include .bashrc if it exists
if [ -f "$HOME/.profile_secrets" ]; then
. "$HOME/.profile_secrets"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Add global Yarn binaries
# https://stackoverflow.com/a/26759734
if ! [ -x "$(command -v yarn)" ]; then
    export PATH="$PATH:$(yarn global bin)"
fi

# nvm installation: https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# docker-machine helpers
if ! [ -x "$(command -v docker-machine)" ]; then
    dme()
    {
        eval $(docker-machine env $1)
    }
    alias dmr="eval $(docker-machine env -u)"
fi

# Aliases
alias ddd='/usr/bin/git --git-dir=$HOME/.dotdotdot/ --work-tree=$HOME'
alias code=codium

# Additional git aliases (some based on Zsh git plugin)
# https://stackoverflow.com/questions/10610327/delete-all-local-git-branches/10610669#10610669
alias gbd-merged="git branch --merged | grep -v \* | xargs git branch -D"
alias gdlast="gd HEAD~1 HEAD"
alias gcwip="gaa && gcmsg \"wip\""
alias gcuwip="gaa && gc -a -u -m \"wip\""
alias grlast="git reset HEAD~1"
alias gfpl="gf -p && gl"
alias gpf="gp --force-with-lease"

# Yarn aliases
alias y="yarn"
alias ys="yarn && yarn start"
alias yui="yarn upgrade-interactive"
alias yuil="yarn upgrade-interactive --latest"

# Docker aliases
alias doc="docker container"
alias docr="docker container run"
alias doce="docker container exec"
alias docei="docker container exec -it"

# Find content in files
# https://stackoverflow.com/a/17231293
# https://bash.cyberciti.biz/guide/Default_shell_variables_value
# TODO: finish 
# grfcc()
# {
#   NEEDLE="$1"
#   HAYSTACK="${2:-$(pwd)/*}"
#   echo "$NEEDLE"
#   echo "$HAYSTACK"
#   grep -rnisI "$NEEDLE" "$HAYSTACK"
# }
alias grfc="grep -rnisI $@"

# WIP
# alias ff="sudo find $0 -type f -iname $1"
# alias ffg="sudo find / -type f -iname $@"
# alias ffl="find . -type f -iname $@"

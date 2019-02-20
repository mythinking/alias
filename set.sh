#!/bin/sh

USER=$(env | grep USER | cut -d '=' -f 2)

cat > /tmp/alias_0000000000000000 <<EOF

################# personal alias begin ################
export PS1="\[\e[33;40m\][\u@\[\e[1;35m\]\t\[\e[0m\] \w]\\$\[\e[0m\]"

alias tf='tail -f'
alias llh='ll -h'
alias pg='ps -ef|grep'
alias yumi='yum install -y'

# docker
alias d='docker'
alias dc='docker container'
alias di='docker image'
alias dcs='docker ps'
alias dis='docker image ls'

# git
alias ga='git add'
alias gst='git status'
alias gba='git branch -a'
alias gf='git diff'
alias gl='git log'
alias gai='git add -i'
alias gm='git commit -m'
alias gc='git checkout'
alias gme='git merge'
alias tf='tail -f'
alias gfetch='git fetch'
############### personal alias end #################

EOF

FILE="$(env |grep 'HOME=' |cut -d '=' -f 2)/.bashrc"

if [ $USER == 'root' ]; then
	FILE='/etc/profile'
fi

echo "set $FILE"

# add alias
cat /tmp/alias_0000000000000000 >> $FILE

# apply
`source $FILE`

# clean
rm -f /tmp/alias_0000000000000000

exit 0

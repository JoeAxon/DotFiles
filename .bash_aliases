# ~/.bash_aliases


# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git
alias gitfresh="git checkout master; git pull"
alias gitclean="git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d"
alias gitlog="git log --oneline --graph --color"
alias gitfixup="git add -u;git commit --amend -C HEAD"

# color aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

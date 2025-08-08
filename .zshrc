export ZSH=/Users/adamruul/.oh-my-zsh


ZSH_THEME="robbyrussell"

alias explore='open -a Finder ./'
alias rmdir='rm -rf'
alias myip='curl ifconfig.me/ip'
alias localip='ipconfig getifaddr en0'
alias gstatus='git status -sb'

alias gt='git'
alias qlg='git lg | grep ago'
alias mylog='gt lg | grep Adam'

alias md5sum='openssl md5'

alias disk_space='df -P -kHl'
alias gdiff='git diff --color | diff-so-fancy' # fancy git diff using diff-so-fancy

source $ZSH/oh-my-zsh.sh
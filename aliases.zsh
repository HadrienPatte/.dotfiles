# grep aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls aliases
alias ls='ls --color=auto --time-style=long-iso -v'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# Kubernetes aliases
alias d='docker'
alias dc='docker-compose'
alias k='kubectl'
alias kn='kubens'
alias kx='kubectx'

# fasd aliases
alias j='fasd_cd -d'
alias v='f -e vim -b viminfo'
alias o='f -e xdg-open'

# Misc aliases
alias e='exit'
alias ssu='sudo -sE'
alias h='history'
alias s='git status'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue) %an %Creset" --abbrev-commit'
alias g='git'

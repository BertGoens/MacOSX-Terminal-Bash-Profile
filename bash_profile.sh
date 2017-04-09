export M2_HOME=~/apache-maven-3.3.3
export PATH=$PATH:$M2_HOME/bin:$GOPATH/bin
export GOPATH=$HOME/gocode

# http://osxdaily.com/2013/02/05/improve-terminal-appearance-mac-os-x/

# Rearrange promt to: "username@hostname:cwd $"
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

# Enable Command Line Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# -G = colorized output
# -h = makes sizes human readable
# -F throws a / after a directory, * after executable, @ after symlink
alias ls='ls -GFh'

# My custom commands are in here
export PATH=$PATH:~/bin

source /usr/local/lib/dnx/bin/dnvm.sh

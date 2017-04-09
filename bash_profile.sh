# https://github.com/BertGoens/MacOSX-Terminal-Bash-Profile

### MODIFY TERMINAL OUTPUT COLORS

# SOURCES
# http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
# http://osxdaily.com/2013/02/05/improve-terminal-appearance-mac-os-x/
# http://osxdaily.com/2011/10/03/add-a-separator-time-stamp-between-terminal-commands-to-increase-readability/
# https://raw.githubusercontent.com/osxdaily/bash_profile/master/terminal-line-separator

# As mentioned before, non-printing escape sequences have to be 
# enclosed in \[\033[ and \]. For colour escape sequences, they 
# should also be followed by a lowercase m.

# CONSOLE TEXT COLORS
Black='\[\033[30m\]'
Blue='\[\033[34m\]'
Green='\[\033[32m\]'
Cyan='\[\033[36m\]'
Red='\[\033[31m\]'
Purple='\[\033[35m\]'
Brown='\[\033[33m\]'
Light_Gray='\[\033[37m\]'

Dark_Gray='\[\033[1;30m\]'
Light_Blue='\[\033[1;34m\]'
Light_Green='\[\033[1;32m\]'
Light_Cyan='\[\033[1;36m\]'
Light_Red='\[\033[1;31m\]'
Light_Purple='\[\033[1;35m\]'
Yellow='\[\033[1;33m\]'
White='\[\033[1;37m\]'

# For extra colors check out the EchoColorCodes.sh file https://github.com/BertGoens/MacOSX-Terminal-Bash-Profile

# Note, it's better to use reset_style, else you might end up with unexpected [ tokens
# Leaving this for legacy reasons only
Reset_Color='[\033[m\]' 

# Other codes available include 
# 4: Underscore, 5: Blink, 7: Inverse, and 8: Concealed.

# TERMINAL CODES
# \u = username
# \h = hostname
# \w = current working directory
# \t = time
# \n = newline

# OUTPUT
# Fill with minuses
# (this is recalculated every time the prompt is shown in function prompt_command):
fill="--- "

reset_style='\[\033[00m\]'
status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color
command_style=$reset_style'\[\033[1;29m\]' # bold black

# Rearrange promt to: "username@hostname:cwd $"
# export PS1="$Light_Cyan\u$Reset_Color@$Green\h:$Yellow\w$Reset_Color\$ "

# Rearrange promt to:
# -------------------- time
# username:hostname:cwd $ (custom-color-output-text) 
# normal color result text
# -------------------- time
PS1="$status_style"'$fill \t\n'"$reset_style$Light_Cyan\u$reset_style@$Green\h:$Yellow\w$reset_style$ $command_style"

# Reset color for command output
# (this one is invoked every time before a command is executed):
trap 'echo -ne "\033[00m"' DEBUG

# create a $fill of all screen width minus the time string and a space:
function prompt_command {
    let fillsize=${COLUMNS}-9
    fill=""

    while [ "$fillsize" -gt "0" ]
    do
        fill="-${fill}" # fill with underscores to work on
        let fillsize=${fillsize}-1
    done
}
PROMPT_COMMAND=prompt_command

# Enable Command Line Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Enable better ls command by default
# -a = shows hidden files
# -G = colorized output
# -h = makes sizes human readable
# -F = throws a / after a directory, * after executable, @ after symlink
# -l = outputs a list
alias ls='ls -aGFhl'

# Enable grep colors
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;32"

# My custom commands are in here
export PATH=$PATH:~/bin

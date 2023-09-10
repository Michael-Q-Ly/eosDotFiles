# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -iv'

# Default to human readable figures
# alias df='df -h'
# alias du='du -h'

# Misc :)
alias less='less -r'					# raw control characters
alias whence='type -a'					# where, of a sort
alias grep='grep --color'				# show differences in color
alias egrep='grep -E --color=auto'			# show differences in color
alias fgrep='grep -F --color=auto'			# show differences in color

# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'				# classify files in color
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'					# long list
alias la='ls -A'					# all but . and ..
alias l='ls -CF'
alias t='tree -L 1'
alias mkdir='mkdir -v'

# Text editor
# alias vi='vim'
# alias vim='nvim'

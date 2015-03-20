# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
export SPEC_OPTS="--format documentation"

source $HOME/.git_bash_completion

# change prompt when using git
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
if [ $EUID == '0' ]; then
  PS1="\[\e[32m\]\$(parse_git_branch)\[\e[m\]\h:\W # "
else
  PS1="\[\e[32m\]\$(parse_git_branch)\[\e[m\]\h:\W\$ "
fi
export PS1
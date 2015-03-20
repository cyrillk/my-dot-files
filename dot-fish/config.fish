# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme clearance

# Plugins
set fish_plugins brew osx python

# Settings
# set --erase fish_greeting

# Aliases
alias gg "git status"
alias ff "find . ! -iwholename '*.git*' -type f -name"
alias em "emacs"
alias ec "emacslient -t"
alias ed "emacs --daemon"

# Django development mode
set -g -x DEVELOPMENT 1

# set -g -x PATH /usr/local/bin $PATH
set -g -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -g -x MANPAT /usr/local/opt/coreutils/libexec/gnuman $MANPATH

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Load autojump configuration.
[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

egrep "^export " ~/.secret_profile | while read e
  set var (echo $e | sed -E "s/^export ([A-Z_]+)=(.*)\$/\1/")
  set value (echo $e | sed -E "s/^export ([A-Z_]+)=(.*)\$/\2/")

  # remove surrounding quotes if existing
  set value (echo $value | sed -E "s/^\"(.*)\"\$/\1/")

  if test $var = "PATH"
    # replace ":" by spaces. this is how PATH looks for Fish
    set value (echo $value | sed -E "s/:/ /g")

    # use eval because we need to expand the value
    eval set -xg $var $value

    continue
  end

  # evaluate variables. we can use eval because we most likely just used "$var"
  set value (eval echo $value)

  #echo "set -xg '$var' '$value' (via '$e')"
  set -xg $var $value
end


# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/kirill/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/kirill/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -gx EDITOR "vim"

# Go
set -gx GOPATH "/Users/kirill/gocode"
set -gx PATH $GOPATH/bin $PATH

# Aliases
alias ll "ls -la"
alias gg "git status"
alias do "docker"
alias dm "docker-machine"
alias h "history"

function ff -d 'Find by name.'
  find . ! -iwholename "*/target/*" -type f -name "*$argv*"
end

function em -d 'Emacs.'
  open -a /Applications/Emacs.app $argv
end  

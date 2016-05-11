# Vim
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

function gohome -d 'My go home'
  cd $GOPATH/src/github.com/cyrillk
end

function ff -d 'Find by name.'
  find . ! -iwholename "*/target/*" -type f -name "*$argv*"
end

function em -d 'Emacs.'
  open -a /Applications/Emacs.app $argv
end  

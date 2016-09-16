# Vim
set -gx EDITOR "vim"

# Go
set -gx GOPATH "/Users/kirill/gocode"
set -gx PATH "$GOPATH/bin" $PATH

# Brew
set -gx PATH "/usr/local/sbin" $PATH

# Fuck
eval (thefuck --alias | tr '\n' ';')

# Aliases
alias kk "kubectl"
alias ff "fleetctl"
alias ll "ls -la"
alias gg "git status"
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

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

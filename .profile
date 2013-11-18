PATH=/usr/local/bin:$HOME/Library/Haskell/bin:$PATH

export PS1="\W $ "
export EDITOR='mvim -v'

# rbenv + homebrew
export RBENV_ROOT="$(brew --prefix rbenv)"
export GEM_HOME="$(brew --prefix)/opt/gems"
export GEM_PATH="$(brew --prefix)/opt/gems"

# node.js
export NODE_PATH='/usr/local/lib/node_modules'
alias mocha-watch='nodemon --quiet --watch lib --watch test $NODE_PATH/mocha/bin/mocha'

# Make ack respect per-directory config files
export ACKRC=".ackrc"

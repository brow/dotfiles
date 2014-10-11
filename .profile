PATH=/usr/local/bin:$HOME/Library/Haskell/bin:$PATH

export PS1="\W $ "
export EDITOR='mvim -v'

alias vim='mvim -v'

# node.js
export NODE_PATH='/usr/local/lib/node_modules'
alias mocha-watch='nodemon --quiet --watch lib --watch test $NODE_PATH/mocha/bin/mocha'

# Make ack respect per-directory config files
export ACKRC=".ackrc"

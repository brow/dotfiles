PATH=/usr/local/bin:/Users/tombrow/Library/Haskell/bin:$PATH

export PS1="\W $ "
export EDITOR='mvim -v'
export NODE_PATH='/usr/local/lib/node_modules'

alias mocha-watch='nodemon --quiet --watch lib --watch test $NODE_PATH/mocha/bin/mocha'

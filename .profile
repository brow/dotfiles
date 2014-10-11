PATH=/usr/local/bin:$HOME/Library/Haskell/bin:$PATH

export CODEZ=~/Documents/asana
export ASANA_GIT_NAME="Tom Brow"
export ASANA_GIT_EMAIL="tom@asana.com"
export ASANA_ARCH=x64
export MYSQL=mysql5
export CONFIG=sand
export MAC_CONFIGURE_VERSION=2 # only for clean installs
source $CODEZ/admin/mac.bashrc

export PS1="\W $ "
export EDITOR='mvim -v'

alias vim='mvim -v'

# node.js
export NODE_PATH='/usr/local/lib/node_modules'
alias mocha-watch='nodemon --quiet --watch lib --watch test $NODE_PATH/mocha/bin/mocha'

# Make ack respect per-directory config files
export ACKRC=".ackrc"

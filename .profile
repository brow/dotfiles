PATH=/usr/local/bin:$HOME/Library/Haskell/bin:$PATH

export PS1="\W $ "
export EDITOR='vim' 

# node.js
export NODE_PATH='/usr/local/lib/node_modules'
alias mocha-watch='nodemon --quiet --watch lib --watch test $NODE_PATH/mocha/bin/mocha'

# Make ack respect per-directory config files
export ACKRC=".ackrc"

# Google App Engine
# export GAE_SDK_PATH=$HOME/google-cloud-sdk/platform/google_appengine

# http://docs.python-guide.org/en/latest/writing/gotchas/#disabling-bytecode-pyc-files
export PYTHONDONTWRITEBYTECODE=1

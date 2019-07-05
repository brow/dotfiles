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

# Automatically change profile to match macOS appearance (dark vs. light)
# http://apas.gr/2018/11/dark-mode-macos-safari-iterm-vim/
if [[ "$(uname -s)" == "Darwin" ]]; then
    sith() {
        val=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
        if [[ $val == "Dark" ]]; then
            i
        fi
    }

    i() {
        if [[ $ITERM_PROFILE == "Light" ]]; then
            echo -ne "\033]50;SetProfile=Dark\a"
            export ITERM_PROFILE="Dark"
        else
            echo -ne "\033]50;SetProfile=Light\a"
            export ITERM_PROFILE="Light"
        fi
    }

    sith
fi

# Suppress Fastlane update prompts
# https://github.com/fastlane/fastlane/issues/7746
export FASTLANE_SKIP_UPDATE_CHECK=1

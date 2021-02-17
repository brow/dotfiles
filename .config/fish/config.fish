
function fish_prompt
    echo "> "
end

# no vi mode
fish_default_key_bindings

function fish_mode_prompt
end

set fish_cursor_insert line

set EDITOR emacs

# Disable greeting
set fish_greeting

# Suggested by homebrew
set PATH /usr/local/opt/ruby/bin /usr/local/sbin /usr/local/bin $PATH

# `emacs -nw` opens emacs in terminal rather than GUI
# TERM varible makes themes work there:
# https://github.com/syl20bnr/spacemacs/wiki/Terminal
# https://github.com/syl20bnr/spacemacs/issues/1269
alias enw="env TERM=xterm-24bit emacs -nw"

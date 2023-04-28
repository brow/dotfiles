
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
set PATH /usr/local/opt/ruby/bin /usr/local/sbin /usr/local/bin /opt/homebrew/bin $PATH

# Square
set DEVELOPMENT_TEAM_ID B55P8QP425
rvm default

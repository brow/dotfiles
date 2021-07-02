
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

# "In the final steps of its installation, Nix sets up a few environment
# variables in a bash script. I've adapted these specifically for fish on
# macOS." -- https://duan.ca/2020/12/13/nix-on-macos-11-big-sur/
set -x NIX_PROFILES "/nix/var/nix/profiles/default $HOME/.nix-profile"
set -x NIX_SSL_CERT_FILE "$HOME/.nix-profile/etc/ssl/certs/ca-bundle.crt"
set -x NIX_PATH /nix $HOME/.nix-defexpr/channels
set -x PATH $HOME/.nix-profile/bin $PATH

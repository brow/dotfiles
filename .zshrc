# Set prompt to "> "
PROMPT="> "

# Enable vim mode
bindkey -v

# Fish-style history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey -M vicmd "k" history-beginning-search-backward-end
bindkey -M vicmd "j" history-beginning-search-forward-end

# Enable edit-command-line (press 'v' in normal mode to edit in vim)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.localaliases" ]] && source "$HOME/.localaliases"

# Adding libexec/bin to path
export PATH=$PATH:/opt/homebrew/opt/python@3/libexec/bin

# Add local bin to path (claude is installed here)
export PATH="$HOME/.local/bin:$PATH"

# Experimental `claude` flags to preserve context when MCPs are enabled. They
# are mutually exclusive, so set only one to true
#
# https://github.com/anthropics/claude-code/issues/12836#issuecomment-3629052941
export ENABLE_EXPERIMENTAL_MCP_CLI=false
export ENABLE_TOOL_SEARCH=true

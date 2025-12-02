# `git -C`

NEVER use `git -C` unless absolutely necessary. Prefer `cd /some-dir && git some-command`.

# Avoid piped commands

Avoid using pipes (`|`) in shell commands. Piped commands trigger permission prompts even when individual commands are pre-approved. Use direct arguments instead (e.g., `jq '.key' file.json` instead of `cat file.json | jq '.key'`).

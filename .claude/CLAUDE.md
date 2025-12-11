# `git -C`

NEVER use `git -C` unless absolutely necessary. Prefer `cd /some-dir && git some-command`.

# Avoid piped commands

Avoid using pipes (`|`) in shell commands. Piped commands trigger permission prompts even when individual commands are pre-approved. Use direct arguments instead (e.g., `jq '.key' file.json` instead of `cat file.json | jq '.key'`).

# Hyperlink references

When mentioning specific Slack messages, channels, threads, web pages, documents, or other linkable resources, always format them as markdown hyperlinks. Use the actual URL when available (e.g., `[#general](https://app.slack.com/client/T123/C456)` or `[this message](https://slack.com/archives/C123/p1234567890)`).

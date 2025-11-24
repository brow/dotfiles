# List Current Claude Code Permissions

You are helping the user review their current Claude Code permissions.

## Task
1. Read the user's `~/.claude/settings.json` file
2. Extract and display the permissions section in an organized, readable format
3. Categorize the permissions by type for easier review

## Display Format
Organize the permissions into these categories:

### GitHub CLI Commands
- List all `Bash(gh ...)` permissions

### Git Commands
- List all `Bash(git ...)` permissions

### Shell Commands
- List general shell commands like `ls`, `cat`, `grep`, etc.

### Development Tools
- List development-specific commands like `bazel`, `npm`, `yarn`, `brew`, etc.

### MCP Tools
- List all `mcp__*` permissions

### Claude MCP Commands
- List all `Bash(claude mcp ...)` permissions

### Built-in Tools
- List tools like `Read`, `Grep`, `Glob`, etc.

### Other Permissions
- List any permissions that don't fit the above categories

## Additional Information
- Count the total number of permissions
- Identify any potentially dangerous permissions if present
- Suggest any common read-only commands that might be missing

## Example Output Format
```
Current Claude Code Permissions
================================

📊 Total Permissions: X

GitHub CLI (X permissions):
✓ gh pr view, list, status, checks, diff
✓ gh issue view, list, status
✓ gh repo view, list
[...]

Git Commands (X permissions):
✓ git status, log, diff, show, branch
✓ git config --get, --list
[...]

Shell Commands (X permissions):
✓ ls, cat, pwd, whoami, which
✓ grep, find, head, tail
[...]

[Continue for other categories]

💡 Suggestions:
- Consider adding: [any missing common read-only commands]

⚠️ Caution:
- [List any potentially risky permissions if found]
```

Now read the settings file and provide this organized view of the current permissions.
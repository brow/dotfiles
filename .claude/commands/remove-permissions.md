# Remove Permissions from Claude Code

You are helping the user remove specific permissions from their Claude Code settings.json file.

## Task
1. First, read the current `~/.claude/settings.json` file to see existing permissions
2. Ask the user which permissions they want to remove:
   - Specific commands/tools
   - Entire categories (e.g., all git commands, all MCP tools)
   - Permissions matching a pattern
3. Show them what will be removed and confirm before making changes
4. Remove the specified permissions while preserving all others

## Removal Options
Offer these approaches:

### 1. Remove Specific Permissions
Remove individual entries like:
- `"Bash(git commit:*)"`
- `"mcp__slack__post_message"`

### 2. Remove by Category
- All Git commands (starting with `Bash(git `)
- All GitHub CLI commands (starting with `Bash(gh `)
- All MCP tools (starting with `mcp__`)
- All shell commands (like ls, cat, grep)

### 3. Remove by Pattern
- All commands containing certain text
- All Bash commands for a specific tool

## Safety Process
1. **List** - Show current permissions that match the removal criteria
2. **Confirm** - Ask for explicit confirmation before removing
3. **Backup** - Mention that settings are being modified (they can restore from Git if needed)
4. **Update** - Remove the specified permissions
5. **Verify** - Show the updated permissions list

## Example Interaction
```
"I'll help you remove permissions. What would you like to remove?"
Options:
1. Specific permissions (list them)
2. All permissions for a category (git, gh, mcp, etc.)
3. Permissions matching a pattern

[After user specifies]

"This will remove the following X permissions:"
- Permission 1
- Permission 2
[...]

"Proceed with removal? (The file will be updated)"
```

## Important Notes
- Always preserve the JSON structure integrity
- Keep all other settings intact (env, enabledPlugins, etc.)
- Don't remove permissions the user didn't explicitly request
- Remind user they can use `/add-permissions` to re-add if needed

Now ask the user what permissions they'd like to remove.
# Manage Claude Code Permissions

You are helping the user manage their Claude Code permissions in `~/.claude/settings.json`.

## Available Actions

### 1. 📋 List Current Permissions
Show all currently configured permissions, organized by category
- Use `/list-permissions` for detailed view

### 2. ➕ Add New Permissions
Add new tools or commands that can run without approval
- Use `/add-permissions` for guided addition

### 3. ➖ Remove Permissions
Remove specific permissions or entire categories
- Use `/remove-permissions` for guided removal

### 4. 🔍 Check Permission Status
Check if specific commands/tools are currently allowed

### 5. 📦 Add Permission Sets
Quick-add common permission sets:

#### Development Essentials
```json
"Read", "Grep", "Glob",
"Bash(ls:*)", "Bash(cat:*)", "Bash(pwd:*)", "Bash(which:*)"
```

#### Git Workflow (Read-only)
```json
"Bash(git status:*)", "Bash(git log:*)", "Bash(git diff:*)",
"Bash(git branch:*)", "Bash(git remote:*)"
```

#### GitHub CLI (Read-only)
```json
"Bash(gh pr view:*)", "Bash(gh pr list:*)", "Bash(gh issue view:*)",
"Bash(gh repo view:*)", "Bash(gh api:*)"
```

#### System Information
```json
"Bash(whoami:*)", "Bash(hostname:*)", "Bash(date:*)", "Bash(uname:*)",
"Bash(df:*)", "Bash(ps:*)"
```

#### Package Managers (Info only)
```json
"Bash(npm list:*)", "Bash(yarn list:*)", "Bash(brew list:*)",
"Bash(pod --version:*)", "Bash(bundle --version:*)"
```

### 6. 🔒 Security Review
Review current permissions for potential security concerns

### 7. 💾 Backup/Restore
- Create a backup of current permissions
- Restore from a previous configuration

## Quick Commands
- **List all**: `/list-permissions`
- **Add new**: `/add-permissions`
- **Remove**: `/remove-permissions`
- **Check specific**: Ask "Is X command allowed?"

## Permission Syntax Reference
- **Bash commands**: `"Bash(command:*)"` - The `:*` matches all arguments
- **MCP tools**: `"mcp__server__tool"` - Exact name, no patterns
- **Built-in tools**: `"Read"`, `"Grep"`, `"Glob"` - Exact names

## Safety Guidelines
✅ **Safe to add** (read-only operations):
- File listing/reading commands
- Status/info commands
- Version checks
- Search/grep operations

⚠️ **Requires caution**:
- Package installers (even with specific packages)
- Any file modification commands
- Network operations beyond simple GET

❌ **Never auto-approve**:
- Delete/remove commands
- Git push/commit operations
- System configuration changes
- Credential/secret operations

## What would you like to do?
1. List current permissions
2. Add new permissions
3. Remove permissions
4. Check permission status
5. Add a permission set
6. Security review
7. Other (specify)

Please choose an option or describe what you'd like to do with permissions.
# Add Permissions to Claude Code

You are helping the user add new permissions to their Claude Code settings.json file.

## Current Context
The user wants to add new permissions to their `~/.claude/settings.json` file. The permissions section controls which tools and commands can be executed without requiring user approval.

## Input Handling
The user can provide permissions in two ways:
1. **Raw shell command invocation**: A complete shell command line (e.g., `git status && npm list | grep foo`)
2. **Interactive mode**: If no command is provided, ask what permissions they want to add

## Task
1. First, read the current settings file to understand the existing permissions structure
2. If the user provided a raw shell command invocation:
   - Parse the command line to extract all individual commands
   - Handle common shell operators: `&&`, `||`, `;`, `|` (pipes), `&` (background)
   - Handle command substitution: `$(...)` and backticks
   - Extract the base command (first word) from each command
   - Generate permission patterns in the format `Bash(command:*)`
   - Check if each command is safe (read-only)
   - Add all extracted permissions to the settings file
3. If no command provided, ask the user what type of permissions they want to add:
   - Bash commands (e.g., `Bash(command:*)`)
   - MCP tools (e.g., `mcp__server__tool_name`)
   - Other tools (e.g., `Read`, `Grep`, `Glob`)
4. Help them identify whether the commands/tools are truly read-only and safe
5. Add the new permissions to the appropriate section in the settings file

## Parsing Shell Command Invocations
When parsing a raw command line:
- Split on shell operators: `&&`, `||`, `;`, `|`, `&`
- Extract the command name (first token after splitting on spaces)
- Handle common patterns:
  - `command arg1 arg2` → `Bash(command:*)`
  - `git status && npm list` → `Bash(git status:*)`, `Bash(npm list:*)`
  - `ls -la | grep foo` → `Bash(ls:*)`, `Bash(grep:*)`
  - `bundle exec pod install` → `Bash(bundle exec pod install:*)`
  - Commands starting with `sudo` should extract the actual command after sudo
- Ignore variable assignments (e.g., `FOO=bar command` → just extract `command`)
- Ignore redirections (`>`, `>>`, `<`) when extracting command names

## Permission Format Examples
- **Bash commands**: `"Bash(command:*)"` - The `:*` allows all variations/flags
- **Git commands**: `"Bash(git status:*)"`, `"Bash(git log:*)"`
- **MCP tools**: `"mcp__slack__get_channel_messages"` (no patterns allowed)
- **Built-in tools**: `"Read"`, `"Grep"`, `"Glob"` (exact tool names)

## Important Guidelines
- Only add read-only, non-destructive commands to permissions
- For Bash commands, use the pattern `Bash(command:*)` to match all variations
- MCP tools don't support patterns - use exact tool names
- Always preserve existing permissions when updating
- Warn about any potentially dangerous permissions

## Safety Considerations
Ask yourself:
- Is this command read-only?
- Could this command modify files or system state?
- Could this command expose sensitive information?
- Is this commonly needed for development workflows?

Common safe categories:
- File inspection (ls, cat, head, tail, etc.)
- Version checks (--version commands)
- Status commands (git status, npm list, etc.)
- Search/grep operations
- System info (whoami, pwd, date, etc.)

Commands to be cautious about:
- Any write operations (rm, mv, cp, mkdir)
- Git operations that modify (commit, push, merge)
- Package managers installing/updating (npm install without specific packages)
- Network operations that could POST/PUT data

Now, ask the user what permissions they'd like to add and help them add them safely to their configuration.
---
allowed-tools:
  - mcp__slack__get_user_info
  - mcp__slack__search_messages
  - Read
  - Edit
  - Write
  - Glob
---

# Update Daily Note from Slack

Update the daily note with work items from today's Slack messages that aren't already captured.

## Arguments

- `$ARGUMENTS` - Optional: path to daily note file. Defaults to `/Users/tomb/Documents/today/YYYY-MM-DD.md` for today's date.

## Instructions

1. Get user info from Slack to determine timezone and user ID
2. Search for messages sent by the user today using `search_messages` with `from_user_id_or_usernames: [{username: "me"}]` and `on: "today"`
3. Search for messages mentioning the user today using `search_messages` with `query_terms: "@me"` and `on: "today"`
4. Read the current daily note (create if it doesn't exist)
5. List existing `.md` files in the daily notes directory to know which wiki-links are valid
6. Identify substantive work items from both message sets that aren't already noted
7. Update the daily note following the style guide below

## Style Guide

### What to Include
- Substantive work: discussions, investigations, PRs, decisions, promotions of ideas
- Threads you started or meaningfully contributed to
- Documents you shared or referenced
- Problems you raised or helped solve

### What to Exclude
- Casual tips, TILs, or observations shared in passing
- Complaints without action
- Brief acknowledgments or reactions
- Items tangential to your main work streams

### Formatting Rules

**Structure:**
- Group related items under topic headers (use `[[Wiki Link]]` only if a note for that topic exists)
- Use existing topic headers when the work fits; create new ones sparingly
- Sub-items under topics describe specific actions with links
- Standalone items (not part of a topic) go at top level

**Links:**
- Wrap the action verb or short phrase in the link: `[Raised](url) issue with X` or `[Trying out X as solution](url)`
- Link to the most relevant artifact (PR, thread start, doc) not auxiliary links

**Wiki-links (Obsidian-style):**
- `[[Note Name]]` links to another note in the same vault (directory)
- Only use wiki-links when a corresponding `.md` file exists (e.g., `[[Headless Goose]]` requires `Headless Goose.md`)
- Use for: recurring topics, projects, and people that have dedicated notes
- Do NOT create wiki-links speculatively - if no file exists, use plain text instead

**Tone:**
- Concise action phrases, not full sentences
- Present participle or past tense verbs: "Trying out", "Raised", "Promoted", "Investigating"
- No redundant detail - trust that the link provides context

**Bullets:**
- Use `-` or `*` for items (either is fine)
- Use `[ ]` for incomplete action items / todos
- Indent sub-items with tabs

### Example Transformations

Bad (too verbose):
```
- Proposed [UISceneSizeRestrictions](apple-docs-link) (particularly minimumSize) as a solution for UI breakage
- Kicked off [on-demand sim build](buildkite-link) testing UIScene lifecycle + minimumSize
- [PR #139569](github-link) for UIScene testing
```

Good (concise, consolidated):
```
- [Trying out UISceneSizeRestrictions as a solution](github-pr-link)
```

Bad (tangential):
```
- Shared [Claude Code tip in #protips](link): prompt it to open PRs in draft
```

Good: (omit entirely - not substantive work)

Bad (invalid wiki-link):
```
- [[New Project]] kickoff meeting
```
(if `New Project.md` doesn't exist)

Good (plain text for non-existent notes):
```
- New Project kickoff meeting
```

## Default Location

Daily notes are stored at `/Users/tomb/Documents/today/` with filename format `YYYY-MM-DD.md`.

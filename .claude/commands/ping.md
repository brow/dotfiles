---
allowed-tools:
  - Bash(gh pr view:*)
  - Bash(gh pr checks:*)
  - Bash(gh pr diff:*)
  - Bash(gh api:*)
  - mcp__slack__post_message
  - mcp__slack__get_channel_info
---

# Ping for PR Reviews

Request reviews for a GitHub pull request by posting to the appropriate Slack channels identified by Owner Owl.

## Arguments

- `$ARGUMENTS` - The GitHub PR URL (e.g., https://github.com/owner/repo/pull/123)

## Instructions

### Step 1: Gather PR Information

1. Parse the PR URL to extract owner, repo, and PR number
2. Fetch PR details: `gh pr view <number> --repo <owner>/<repo> --json title,body,files,additions,deletions`
3. Fetch Owner Owl comment: `gh api repos/<owner>/<repo>/issues/<number>/comments --paginate | jq -r '.[] | select(.user.login | test("owl"; "i")) | .body'`
4. Check PR status: `gh pr checks <number> --repo <owner>/<repo>`

### Step 2: Identify Pending Reviews

From the Owner Owl comment, identify modules that are NOT passing (marked with a red X or showing pending status). For each pending module, extract:
- Module name
- Slack channel to ping (from the blockquote in the module's details section)
- What's needed (e.g., "1 core approval")

### Step 3: Categorize Channels

Determine which channels:
- **Can receive automated messages**: Standard channels without posting restrictions
- **Require manual posting**: Channels with workflows, posting restrictions, or other limitations (check channel info if uncertain)

### Step 4: Draft the Message

Create a message in this format:
```
Hi all, may I have a review on <PR_URL|this>? <ONE_SENTENCE_SUMMARY>
```

The summary should:
- Be a single sentence
- Accurately describe the changes based on the PR body and diff
- Emphasize if the change is straightforward (e.g., "documentation-only", "single-line fix", etc.)

### Step 5: Present for Approval (MANDATORY)

Present the user with:

1. **Proposed message**: Show the exact message that will be sent
2. **Channels for automated posting**: List channels where the message can be posted automatically
3. **Channels requiring manual posting**: List channels where the user must post manually (e.g., channels with workflows or restrictions)

Then STOP and WAIT for the user to explicitly approve before proceeding. Use phrasing like:

```
Ready to post when you approve. Reply with "send", "go", "yes", or similar to proceed.
```

### Step 6: Send Messages (Only After Approval)

After receiving explicit user approval:
1. Post the message to each approved channel using `mcp__slack__post_message`
2. Report success/failure for each channel
3. Provide direct links to the posted messages
4. Remind the user about any channels that require manual posting

## CRITICAL RULES

- **NEVER send any Slack message without explicit user approval**
- **ALWAYS wait for a subsequent message from the user before posting**
- If a channel post fails, report the error and suggest manual posting
- Do not modify the Owner Owl comment or any PR content
- Format Slack links as `<URL|text>` for proper rendering

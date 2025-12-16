---
allowed-tools:
  - Bash(gh pr view:*)
  - Bash(gh pr diff:*)
  - Bash(gh pr checks:*)
  - Bash(gh api:*)
---

# Quick PR Review

Review the GitHub pull request at the provided URL.

## Arguments

- `$ARGUMENTS` - The GitHub PR URL to review (e.g., https://github.com/owner/repo/pull/123)

## Instructions

1. **Parse the PR URL** to extract owner, repo, and PR number from `$ARGUMENTS`

2. **Fetch existing comments and reviews** before doing your own review:
   - Use `gh api /repos/{owner}/{repo}/pulls/{PR_NUMBER}/comments` to fetch inline review comments (filter out bot users)
   - Use `gh pr view $ARGUMENTS --json reviews,reviewThreads` to fetch review-level comments and threads
   - Note: Focus on comments from human reviewers, not automated bots

3. Fetch the PR details using `gh pr view $ARGUMENTS`
4. Get the PR diff using `gh pr diff $ARGUMENTS`
5. Review the PR for red flags, yellow flags, and nitpicks:
   - **Red flags**: Security vulnerabilities, data loss risks, obvious bugs, broken functionality
   - **Yellow flags**: Race conditions, missing error handling for critical paths, potential performance issues
   - **Nitpicks**: Typos, unintentional dead code, copy-paste artifacts. NOT whitespace, formatting, anything a linter could catch

6. **Incorporate existing feedback** into your review:
   - DO NOT restate points as if you discovered them yourself
   - DO NOT raise issues that have already been adequately addressed in responses
   - You MAY add original insights to topics already being discussed (e.g., a nuance the reviewers missed)
   - Focus your own analysis on issues that haven't been identified yet
   - **However**: Include red/yellow flags raised by others in your summary (attribute them, e.g., "As @reviewer noted..."), and factor them into the approval decision

7. If there are ANY red or yellow flags (whether found by you OR raised by other reviewers), report them to the user with specific line references.
8. If there are NO red flags, approve using `gh pr review --approve` with NO OTHER NAMED PARAMETERS. DO NOT include a `--body` parameter or attach commentary to the approval in any other way. DO NOT skip this step due merely to the PR being merged or closed already; approving merged or closed PRs is valid.

## HYPERLINK REQUIREMENTS

When reporting findings, ALL references to specific lines MUST be hyperlinked to the exact location in the PR.

### URL Format

GitHub PR line URLs follow this format:
- **Single line**: `https://github.com/{owner}/{repo}/pull/{pr}/files#diff-{hash}R{line}`
- **Line range**: `https://github.com/{owner}/{repo}/pull/{pr}/files#diff-{hash}R{start}-R{end}`

Where:
- `{hash}` is the SHA-256 hash of the file path (e.g., `Scripts/path/to/file.rb`)
- `R` indicates the right side (new version) of the diff
- `{line}` is the line number in the new file

### Computing the Hash

Use this bash command to compute the hash for a file path:
```bash
echo -n "path/to/file.rb" | shasum -a 256 | cut -d' ' -f1
```

### Example

For file `Scripts/Gems/rlib/lib/rlib/generator/mint_generator.rb` at line 202:
1. Compute hash: `echo -n "Scripts/Gems/rlib/lib/rlib/generator/mint_generator.rb" | shasum -a 256 | cut -d' ' -f1`
2. Build URL: `https://github.com/owner/repo/pull/123/files#diff-{computed-hash}R202`

### Markdown Format

Use markdown hyperlinks: `[line 202 of mint_generator.rb](https://github.com/...#diff-{hash}R202)`

## CRITICAL RESTRICTIONS

- DO NOT comment on the PR under any circumstances or include any comment with a review
- DO NOT perform any action other than viewing and approving
- The ONLY write action allowed is `gh pr review --approve` with no other named parameters
- Report any concerns directly to the user in the terminal, NOT on the PR

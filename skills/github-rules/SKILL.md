---
name: github-rules
description: Clone, commit, and manage git repositories (Intel internal and public). Use when cloning repos, committing files, or performing git operations.
compatibility: Supports github.com, Intel github.com/intel-innersource, github.com/intel-sandbox
metadata:
  author: Johny.Paul@intel.com
  version: "1.0"
---

# Skill: GitHub Repository Rules

## Rules

1. Check `$GITHUB_TOKEN`, `$GITHUB_INTEL_TOKEN`, `$GH_TOKEN`, `$GITLAB_TOKEN` before asking user
2. If repo ambiguous, ask user to select from options
3. Always clone to `./tmp/` directory
4. Explore repo structure to find correct file locations before committing
5. If user doesn't specify branch name, list available branches (`git branch -a`) and ask which to use
6. Before committing, use Edit tool to make file changes (so user can see exact changes being made)
7. Show changes (`git diff --staged`) and wait for user confirmation before push
8. Never use `--force`, `reset --hard`, `clean -fd`, or destructive commands without explicit approval

## Quick Start

### 1. Check Token

```bash
[ -n "$GITHUB_TOKEN" ] && echo "✅ Token found" || echo "❌ Set GITHUB_TOKEN"
```

For Intel repos, check SSO:
```bash
curl -s -H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/repos/intel-sandbox/<repo> | head -5
```

**If "403 SAML enforcement":** Direct user to https://github.com/enterprises/intel/sso

### 2. Clone to ./tmp/

```bash
mkdir -p ./tmp
cd ./tmp

# Check if already exists
[ -d "<repo-name>" ] && echo "⚠️  Already exists" || \
  git clone https://${GITHUB_TOKEN}@github.com/<org>/<repo>.git
```

### 3. Explore Structure

```bash
cd ./tmp/<repo>
find . -type d -maxdepth 2  # Find directories
find . -name "*.md" -o -name "*.py"  # Find files
```

### 4. Commit Workflow

```bash
# Check status
git status

# If user didn't specify branch, list and ask
git branch -a
# Ask: "Which branch? (or create new branch name)"

# Create new branch OR checkout existing
git checkout -b <new-branch-name>  # New branch
git checkout <existing-branch>     # Existing branch

# Use Edit tool to modify files (user sees exact changes)
# Read file first, then use Edit tool with oldString/newString

# Stage specific files only
git add <file1> <file2>

# Show summary table
git diff --staged --stat

# Show staged changes
git diff --staged

# Present summary table to user:
# | Metric           | Count |
# |------------------|-------|
# | Files Changed    | X     |
# | Lines Added      | +Y    |
# | Lines Deleted    | -Z    |
# | Total Lines      | Y+Z   |

# WAIT for user confirmation, then commit
git commit -m "feat: description"

# Show what will be pushed
git log origin/<branch>..<branch> --oneline

# Push
git push -u origin <branch-name>
```

## Troubleshooting

| Error | Solution |
|-------|----------|
| "403 SAML enforcement" | Authorize at github.com/enterprises/intel/sso |
| "401" | Token expired - ask user for new token |
| Merge conflicts | Show conflicts, ask user how to proceed |
| Already cloned | Ask: use existing, re-clone, or different location |

## References

- Intel SSO: https://github.com/enterprises/intel/sso

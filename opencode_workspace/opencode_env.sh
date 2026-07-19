#!/bin/bash
# OpenCode Environment Configuration
# Source this file to set up environment variables for OpenCode
# Replace <your-token-here> placeholders with your actual values

# AWS Bedrock Configuration
export AWS_REGION="us-east-2"
export AWS_BEARER_TOKEN_BEDROCK="<your-aws-bearer-token-here>"
export CLAUDE_CODE_USE_BEDROCK=1

export OPENCODE_NO_FLICKER=1

export OPENAI_BASE_URL="https://bedrock-mantle.us-east-2.api.aws/v1"
export OPENAI_API_KEY="$AWS_BEARER_TOKEN_BEDROCK"

# Personal Access Tokens (replace with your values)
export JIRA_PAT="<your-jira-pat-here>"
export HF_TOKEN="<your-huggingface-token-here>"
export GITHUB_TOKEN="<your-github-token-here>"
export WIKI_TOKEN="<your-wiki-token-here>"

## G3 server (internal Intel server)
export ANTHROPIC_BASE_URL="http://172.26.46.165:31403"
export ANTHROPIC_AUTH_TOKEN="<your-anthropic-auth-token-here>"

# opencode-init alias
alias opencode-init='$HOME/bin/opencode-init'

alias tmux-remote='$HOME/bin/tmux-remote'

function b70 { if mountpoint -q ~/remote/b70 && [ -d ~/remote/b70/home/johnypau ]; then cd ~/remote/b70/home/johnypau/; else echo "[WARN] b70 mount not available. Run: rclone-init"; return 1; fi; }
function b60 { if mountpoint -q ~/remote/b60 && [ -d ~/remote/b60/home/johnypau ]; then cd ~/remote/b60/home/johnypau/; else echo "[WARN] b60 mount not available. Run: rclone-init"; return 1; fi; }
alias rclone-init='~/remote/rclone.sh'

export DIARY_DISK="https://github.com/johnypaulintel/diary"

# Intel Proxy Configuration
export HTTPS_PROXY=http://proxy-dmz.intel.com:912
export HTTP_PROXY=http://proxy-dmz.intel.com:912
export http_proxy=http://proxy-dmz.intel.com:912
export https_proxy=http://proxy-dmz.intel.com:912

# NO_PROXY settings to bypass proxy for internal networks
export NO_PROXY="localhost,127.0.0.1,.intel.com,intel.com,172.26.0.0/16,172.16.0.0/12,192.168.0.0/16,10.0.0.0/8"
export no_proxy="$NO_PROXY"

#!/usr/bin/env bash
set -euo pipefail

fail=0
scan() {
  local name="$1" pattern="$2"
  shift 2
  if git grep -nIE "$pattern" -- "$@"; then
    echo "::error::Potential $name leak detected" >&2
    fail=1
  fi
}

common_excludes=(
  ':!.git'
  ':!node_modules'
  ':!package-lock.json'
  ':!README.md'
  ':!README.en.md'
  ':!CHANGELOG.md'
  ':!scripts/security-scan.sh'
  ':!.github/workflows/ci.yml'
)

scan 'private key' 'BEGIN (RSA |OPENSSH |EC |DSA |)PRIVATE KEY' . "${common_excludes[@]}"
scan 'Telegram bot token' '[0-9]{8,}:[A-Za-z0-9_-]{30,}' . "${common_excludes[@]}"
scan 'environment secret assignment' '(BOT_TOKEN|CF_API_TOKEN|GITHUB_TOKEN|GH_TOKEN|API_KEY|SECRET|PASSWORD|PASSWD)=([A-Za-z0-9_./+-]{12,})' . "${common_excludes[@]}" ':!.env.example' ':!*.example' ':!servers.example.json'

if [ "$fail" -ne 0 ]; then
  exit 1
fi

echo "security scan passed"

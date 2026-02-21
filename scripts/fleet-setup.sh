#!/bin/bash
set -e

echo "🌌 TURBO FLEET SETUP v1.0 — Worker Onboarding"
echo "Commander: Turbo-the-tech-dev | Target: 1,000 workers"

# Prerequisites
command -v git >/dev/null || { echo "❌ Install git first"; exit 1; }

# Install GitHub CLI
if ! command -v gh >/dev/null; then
  echo "🔧 Installing GitHub CLI..."
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update && sudo apt install gh -y
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install gh || { echo "❌ Brew not found"; exit 1; }
  fi
fi

# Auth & Config
echo "🔑 Authenticating with GitHub (web flow)..."
gh auth login --web

git config --global user.name "Turbo-Fleet-Worker"
git config --global user.email "fleet@turbo-the-tech-dev.dev"

echo ""
echo "✅ WORKER ONBOARDED SUCCESSFULLY!"
echo "📋 Next steps:"
echo "   gh repo clone Turbo-the-tech-dev/__TEMPLATES__"
echo "   cd __TEMPLATES__ && ./scripts/mkacademy.sh JSON-ACADEMY"
echo "   Start Module 01 → report issues"

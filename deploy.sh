#!/bin/bash
# Deployment script for Quran Excel Audio project

set -e  # stop on first error

# CONFIG
USERNAME="mutawakil81"
REPO_NAME="quran-excel-audio"
BRANCH="main"

# ====== AUTHENTICATION OPTIONS ======
# Option 1 (HTTPS + Token): 
#   export GITHUB_TOKEN="your_personal_access_token"
# Option 2 (SSH):
#   Ensure your SSH keys are configured with GitHub

# Check if token is available
if [ -n "$GITHUB_TOKEN" ]; then
  REPO="https://${USERNAME}:${GITHUB_TOKEN}@github.com/${USERNAME}/${REPO_NAME}.git"
  echo "🔑 Using HTTPS with Personal Access Token"
else
  REPO="git@github.com:${USERNAME}/${REPO_NAME}.git"
  echo "🔑 Using SSH authentication"
fi

echo "🚀 Deploying Qur’an Excel & Audio to GitHub..."

# Initialize git if not already
if [ ! -d .git ]; then
  git init
  git branch -M $BRANCH
  git remote add origin $REPO
else
  git remote set-url origin $REPO
fi

# Add files
git add .

# Commit with timestamp
git commit -m "📦 Deployment update on $(date '+%Y-%m-%d %H:%M:%S')" || echo "⚠️ Nothing to commit"

# Push to GitHub
git push -u origin $BRANCH

echo "✅ Deployment finished!"
echo "🌐 Your site will be available shortly at:"
echo "👉 https://mutawakil81.github.io/quran-excel-audio/"


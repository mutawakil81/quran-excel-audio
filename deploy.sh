#!/bin/bash
# Simple deployment script for Quran Excel Audio project

# Stop on first error
set -e

REPO="git@github.com:mutawakil81/quran-excel-audio.git"
BRANCH="main"

echo "🚀 Deploying Qur’an Excel & Audio to GitHub..."

# Initialize git if not already
if [ ! -d .git ]; then
  git init
  git branch -M $BRANCH
  git remote add origin $REPO
fi

# Add files
git add .

# Commit with timestamp
git commit -m "📦 Deployment update on $(date '+%Y-%m-%d %H:%M:%S')"

# Push to GitHub
git push -u origin $BRANCH

echo "✅ Deployment finished!"
echo "🌐 Your site will be available shortly at:"
echo "👉 https://mutawakil81.github.io/quran-excel-audio/"


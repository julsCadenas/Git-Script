#!/bin/bash
set -e

if [[ $# -lt 3 ]]; then
  echo "gits <file/s or .> <commit message> <branch>"
  exit 1  
fi

files=$1
message=$2
branch=$3

[[ "$files" == "." ]] && git add .  || git add "$files"
echo "Files staged successfully."

git commit -m "$message"
echo "Changes committed successfully."

# check if branch exists
git rev-parse --verify "$branch" &>/dev/null || { echo "Branch '$branch' does not exist. Please create it first."; exit 1; }

git push origin "$branch"
echo "Changes pushed to "$branch" successfully."
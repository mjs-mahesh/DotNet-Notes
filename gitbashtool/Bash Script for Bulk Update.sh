#!/bin/bash

# Configurations
ORG=""
REPO_PREFIX=""
NEW_SETTINGS_FILE="C:\Users\gitbashtool\Bash Script for Bulk Update\NewChanges\app-parameters.yaml"
GITHUB_TOKEN=""

# Get repo names (requires 'gh' CLI and access token)
gh auth login  # Auth once interactively if not done before
REPOS=$(gh repo list $ORG --json name -L 1000 | jq -r ".[].name" | grep "^$REPO_PREFIX")

# Loop through each repo and update settings file
for REPO in $REPOS; do
    echo "Processing $REPO"

    # Clone repo or pull latest
    git clone "https://github.com/$ORG/$REPO.git"
    cd "$REPO" || continue

    # Copy new settings file in (overwrite)
    cp "$NEW_SETTINGS_FILE" ./app-parameters.yaml

    # Commit and push
    git checkout -b update-app-parameters.yaml
    git add app-parameters.yaml
    git commit -m "Update app-parameters.yaml for global config sync"
    git push origin update-app-parameters.yaml

    # Optionally, open a PR via gh CLI
    gh pr create --title "Update app-parameters.yaml" --body "Sync app-parameters.yaml globally"
    
    cd ..
    rm -rf "$REPO"
done
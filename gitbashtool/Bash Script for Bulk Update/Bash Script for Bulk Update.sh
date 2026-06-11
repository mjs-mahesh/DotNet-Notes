#!/bin/bash

# Configurations
ORG="AlightEngineering"
REPO_PREFIX="als-lp-svc-"
NEW_SETTINGS_FILE="path/to/your/new/appsettings.json"
GITHUB_TOKEN="YOUR_GITHUB_TOKEN"

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
    cp "$NEW_SETTINGS_FILE" ./appsettings.json

    # Commit and push
    git checkout -b update-appsettings
    git add appsettings.json
    git commit -m "Update appsettings.json for global config sync"
    git push origin update-appsettings

    # Optionally, open a PR via gh CLI
    gh pr create --title "Update appsettings.json" --body "Sync appsettings.json globally"
    
    cd ..
    rm -rf "$REPO"
done
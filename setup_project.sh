#!/bin/bash

echo "🚀 Starting project cleanup and restructure..."

## Step 1: Create new folders
mkdir -p terraform lambda images .github/workflows

## Step 2: Move files
mv main.tf variables.tf outputs.tf terraform/ 2>/dev/null
mv handler.py requirements.txt lambda/ 2>/dev/null
mv repo-banner.png architecture-diagram.png images/ 2>/dev/null
mv terraform.yml .github/workflows/ 2>/dev/null

## Step 3: Create .gitignore if it doesn’t exist
if [ ! -f .gitignore ]; then
  echo "Creating .gitignore..."
    cat <<EOL > .gitignore
    # Terraform
    .terraform/
    terraform.tfstate
    terraform.tfstate.backup
    *.tfstate

    # Python
    __pycache__/
    *.pyc

     Zip and compiled packages
    lambda.zip
    *.zip
    EOL
    else
      echo ".gitignore already exists. Skipping..."
      fi

      # Step 4: Git commit and push
      echo "📦 Staging changes..."
      git add .

      echo "📸 Committing..."
      git commit -m "Refactored project layout and added .gitignore"

      echo "📤 Pushing to GitHub..."
      git push

      echo "✅ Project restructure complete!"

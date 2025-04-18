#!/bin/bash

# Exit on error
set -e

WORKFLOW_FILE=".github/workflows/terraform.yml"

# Ensure the workflow file exists
if [[ ! -f "$WORKFLOW_FILE" ]]; then
  echo "❌ Workflow file not found. Creating a new one..."
  mkdir -p .github/workflows
  touch "$WORKFLOW_FILE"
fi

# Check if Access Analyzer step already exists
if grep -q "Apply Access Analyzer (Terraform)" "$WORKFLOW_FILE"; then
  echo "⚠️ Access Analyzer step already exists in workflow."
  exit 0
fi

# Append Access Analyzer step
echo "🛠️ Updating $WORKFLOW_FILE with Access Analyzer deployment step..."
cat <<'EOF' >> "$WORKFLOW_FILE"

# === Access Analyzer Deployment ===
- name: Apply Access Analyzer (Terraform)
  run: |
    terraform init
    terraform validate
    terraform apply -auto-approve
  env:
    AWS_ACCESS_KEY_ID: \${{ secrets.AWS_ACCESS_KEY_ID }}
    AWS_SECRET_ACCESS_KEY: \${{ secrets.AWS_SECRET_ACCESS_KEY }}
    AWS_REGION: "us-east-1"
EOF

# Git commit and push
echo "📦 Committing updated workflow..."
git add "$WORKFLOW_FILE"
git commit -m "Update CI/CD workflow to include Access Analyzer deployment"
git push

echo "✅ Workflow updated and pushed!"


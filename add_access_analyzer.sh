#!/bin/bash

# Define file content
cat <<EOF > access_analyzer.tf
resource "aws_accessanalyzer_analyzer" "default" {
  name = "access-analyzer"
  type = "ACCOUNT"

  tags = {
    Name = "AccessAnalyzer"
  }
}
EOF

# Git commands
git add access_analyzer.tf
git commit -m "Add AWS IAM Access Analyzer to monitor external access"
git push

echo "✅ access_analyzer.tf created, committed, and pushed!"


#!/bin/bash

# Step 1: Create provider.tf with AWS provider config
cat <<EOF > provider.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
EOF

echo "[✔] Created provider.tf with AWS provider configuration"

# Step 2: Prompt for AWS credentials at runtime (better than hardcoding)
read -p "Enter your AWS_ACCESS_KEY_ID: " AWS_ACCESS_KEY_ID
read -s -p "Enter your AWS_SECRET_ACCESS_KEY: " AWS_SECRET_ACCESS_KEY
echo

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION="us-east-1"

echo "[✔] Exported AWS credentials"

# Step 3: Initialize and apply
terraform init
terraform apply -auto-approve


🖼️ Serverless Image Pipeline with Terraform, S3, Lambda & CloudWatch


This project automates an image-processing pipeline using AWS S3, Lambda, and CloudWatch, all provisioned using Terraform. It's a cloud-native serverless solution ideal for showcasing infrastructure-as-code and automation skills.

📂 Folder Structure
python
Copy
Edit
s3-lambda-image-pipeline/
├── .github/workflows/         # GitHub Actions CI/CD pipeline
│   └── terraform.yml
├── lambda/                    # Python Lambda function
│   ├── handler.py
│   └── requirements.txt
├── terraform/                 # Terraform IaC files
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── images/                    # Assets (banner, diagrams)
│   ├── repo-banner.png
│   └── architecture-diagram.png
├── .gitignore
├── .gitattributes
├── README.md
🏗️ Architecture Diagram

🚀 How It Works
Upload an image to the S3 bucket.

A Lambda function (written in Python) is automatically triggered.

The image is processed (e.g., resized, renamed, compressed).

A CloudWatch log is generated for auditing and debugging.

⚙️ Tech Stack
AWS S3

AWS Lambda

AWS CloudWatch

Terraform

GitHub Actions

Python

🛠️ CI/CD with GitHub Actions
Every push to main runs:

terraform init, validate, and plan

(optional) Terraform apply with approval step

Lambda function packaging and deployment

See .github/workflows/terraform.yml for details.

📸 Terraform Outputs
Example after deployment:

bash
Copy
Edit
terraform output

s3_bucket_name = "image-pipeline-uploads"
lambda_function_name = "imageProcessor"
cloudwatch_log_group = "/aws/lambda/imageProcessor"
🧪 Testing & Debugging
Upload Test: Drop an image in the S3 bucket.

Lambda Logs: View in AWS CloudWatch /aws/lambda/imageProcessor.

Terraform Check: terraform validate, terraform plan.

CI Logs: GitHub Actions tab.

🧠 Portfolio Highlights
✅ Combines Infra-as-Code + Serverless
✅ Uses real-world AWS services
✅ CI/CD pipeline included
✅ Well-documented with visuals
✅ Easily extensible

📎 License
MIT © LMorrison-cyber



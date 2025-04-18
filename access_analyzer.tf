resource "aws_accessanalyzer_analyzer" "default" {
  analyzer_name = "image-pipeline-analyzer"
  type          = "ACCOUNT"

  tags = {
    Name        = "image-pipeline-analyzer"
    Environment = "dev"
  }
}

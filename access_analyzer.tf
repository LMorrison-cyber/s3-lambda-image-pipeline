resource "aws_accessanalyzer_analyzer" "default" {
  analyzer_name = "image-pipeline-analyzer"
  type          = "account"

  tags = {
    Name        = "image-pipeline-analyzer"
    Environment = "dev"
  }
}

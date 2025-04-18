output "lambda_function_name" {
  value = aws_lambda_function.image_processor.function_name
}

output "upload_bucket_name" {
  value = aws_s3_bucket.upload_bucket.bucket
}

output "processed_bucket_name" {
  value = aws_s3_bucket.processed_bucket.bucket
}


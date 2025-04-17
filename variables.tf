variable "upload_bucket" {
  description = "S3 bucket to upload original images"
  default     = "image-upload-bucket-unique-name"
}

variable "processed_bucket" {
  description = "S3 bucket to store resized images"
  default     = "image-processed-bucket-unique-name"
}


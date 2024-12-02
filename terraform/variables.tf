variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "hello-world-function"
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to upload the Lambda ZIP file"
  type        = string
}

variable "lambda_zip_path" {
  description = "The path to the Lambda deployment ZIP file"
  type        = string
}

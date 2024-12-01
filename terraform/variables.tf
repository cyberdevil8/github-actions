variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"  # Updated region
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "hello-world-lambda"
}

variable "zip_file" {
  description = "Path to the ZIP file to upload"
  type        = string
  default     = "artifact/artifact.zip"
}

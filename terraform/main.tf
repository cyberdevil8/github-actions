# main.tf

# S3 Bucket Creation (Ensure the bucket exists)
resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"

  force_destroy = true  # Optional: Deletes the bucket and contents during destroy
}

# Upload Lambda ZIP to S3
resource "aws_s3_object" "lambda_zip" {
  bucket = aws_s3_bucket.lambda_bucket.bucket
  key    = "lambda-deployment.zip"
  source = var.lambda_zip_path  # Path to your Lambda deployment ZIP file
  acl    = "private"
}

# Lambda Function Creation
resource "aws_lambda_function" "hello_world" {
  function_name = "hello_world_lambda"

  s3_bucket = aws_s3_bucket.lambda_bucket.bucket
  s3_key    = aws_s3_object.lambda_zip.key

  runtime = "python3.8"
  role    = aws_iam_role.lambda_execution_role.arn  # Reference the IAM Role

  handler = "lambda_function.lambda_handler"

  environment {
    variables = {
      BUCKET_NAME = var.s3_bucket_name
    }
  }
}

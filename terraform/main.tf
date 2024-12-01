provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "lambda_artifact_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"
}

resource "aws_lambda_function" "hello_world" {
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda_execution_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.9"
  s3_bucket        = aws_s3_bucket.lambda_artifact_bucket.bucket
  s3_key           = "artifact.zip"
  source_code_hash = filebase64sha256("artifact.zip")
}

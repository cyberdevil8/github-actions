resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"

  force_destroy = true
}

resource "aws_lambda_function" "hello_world" {
  function_name = "hello_world_lambda"

  s3_bucket = aws_s3_bucket.lambda_bucket.bucket
  s3_key    = "lambda_function.zip"

  runtime = "python3.9"
  role    = aws_iam_role.lambda_execution_role.arn

  handler = "app.lambda_handler"

  environment {
    variables = {
      BUCKET_NAME = var.s3_bucket_name
    }
  }
}

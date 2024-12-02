resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"

  force_destroy = true  # Optional: Deletes the bucket and contents during destroy
}

resource "aws_s3_object" "lambda_zip" {
  bucket = aws_s3_bucket.lambda_bucket.bucket
  key    = "lambda_function.zip"  # Corrected the key name
  source = "../artifact/artifact.zip"  # Path to the ZIP file generated in the pipeline
  acl    = "private"
}

resource "aws_lambda_function" "hello_world" {
  function_name = var.lambda_function_name

  s3_bucket = aws_s3_bucket.lambda_bucket.bucket
  s3_key    = "lambda_function.zip"  # Matches the key from aws_s3_object

  runtime = "python3.9"
  role    = aws_iam_role.lambda_execution_role.arn

  handler = "app.lambda_handler"  # Corrected handler path (src/app.py)

  environment {
    variables = {
      BUCKET_NAME = aws_s3_bucket.lambda_bucket.bucket
    }
  }
}

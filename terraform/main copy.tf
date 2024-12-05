resource "aws_s3_object" "lambda_zip" {
  bucket = var.s3_bucket_name
  key    = "lambda/artifact.zip"
  source = "${path.module}/../artifact/artifact.zip"
  etag   = filemd5("${path.module}/../artifact/artifact.zip")
}

resource "aws_lambda_function" "hello_world" {
  function_name    = "HelloWorldLambda"
  runtime          = "python3.9"
  handler          = "app.lambda_handler"
  role             = aws_iam_role.lambda_execution_role.arn
  s3_bucket        = var.s3_bucket_name
  s3_key           = aws_s3_object.lambda_zip.key
  source_code_hash = filebase64sha256("${path.module}/../artifact/artifact.zip")
}

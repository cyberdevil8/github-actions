resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_function_name
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "app.lambda_handler"
  filename      = var.zip_file
  source_code_hash = filebase64sha256(var.zip_file)

  environment {
    variables = {
      ENV = "production"
    }
  }
}

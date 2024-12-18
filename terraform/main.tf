# Reference existing IAM role
data "aws_iam_role" "existing_lambda_role" {
  name = "hello_world_github_actions"
}

# lambda function
resource "aws_lambda_function" "hello_world" {
  function_name = "hello_world_lambda"

  s3_bucket = var.s3_bucket_name
  s3_key    = "lambda_function.zip"

  runtime = "python3.9"
  role    = data.aws_iam_role.existing_lambda_role.arn

  handler = "app.lambda_handler"
  
  environment {
    variables = {
      BUCKET_NAME = var.s3_bucket_name
    }
  }

   lifecycle {
    create_before_destroy = false
  }
}

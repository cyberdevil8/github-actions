resource "aws_iam_role" "lambda_role" {
  name               = "${var.lambda_function_name}-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_role.name
}

resource "aws_lambda_function" "hello_world" {
  function_name    = var.lambda_function_name
  runtime          = "python3.9"
  handler          = "app.lambda_handler"
  source_code_hash = filebase64sha256(file("${path.module}/../artifact/artifact.zip"))
  role             = aws_iam_role.lambda_role.arn
  filename         = "${path.module}/../artifact/artifact.zip"
}

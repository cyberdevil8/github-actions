output "lambda_function_arn" {
  value       = aws_lambda_function.hello_world.arn
  description = "ARN of the created Lambda function"
}

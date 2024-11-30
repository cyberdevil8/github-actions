variable "region" {
    description = "AWS region to deploy resources"
    type        =  string
    default     = "ap-south-1"
}

variable "lambda_function_name" {
    description = "Name of the lambda function"
    type        = string
    default     = "hello-world-lambda"
}
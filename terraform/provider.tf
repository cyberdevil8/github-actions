terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" # Correct syntax
    }
  }
  required_version = ">= 1.5.5"
}

provider "aws" {
  region = var.aws_region
}

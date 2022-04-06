terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.8.0"
    }

  }
}

provider "aws" {
  region     = "us-west-2"
  access_key = var.accesskey
  secret_key = var.secret_key
}

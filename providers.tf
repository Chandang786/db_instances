terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.8.0"
    }
  }
}

provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAQDRYIGWXOLQT7DJ3"
  secret_key = "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"
}

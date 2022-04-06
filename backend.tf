terraform {
  backend "s3" {
    bucket         = "terraform-backend-drive"
    key            = "remote.tfstate"
    region         = "us-west-2"
    access_key     = "AKIAQDRYIGWXJQ6ZT72L"
    secret_key     = "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"
    dynamodb_table = "s3-state"
  }
}

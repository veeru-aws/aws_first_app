terraform {
  cloud {
    organization = "veeru_aws"

    workspaces {
      name = "AWS_FIRST_APP"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key=var.access_key
  secret_key = var.secret_key
}
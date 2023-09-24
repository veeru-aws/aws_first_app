terraform {
  cloud {
    organization = "veeru_aws"

    workspaces {
      name = "AWS_FIRST_APP"
    }
  }
}
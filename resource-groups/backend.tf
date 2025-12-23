terraform {
  required_version = ">= 1.4.0, < 2.0.0"
  backend "remote" {
    organization = "ezlee"

    workspaces {
      name = "aws-iam-role-account-pirahnas"
    }
  }
}


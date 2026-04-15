terraform {
  cloud {
    organization = "vinod-techops-org"
    workspaces {
      name = "aws-dev"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.6.0"
}

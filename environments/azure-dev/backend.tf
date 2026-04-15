terraform {
  cloud {
    organization = "vinod-techops-org"
    workspaces {
      name = "azure-dev"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.6.0"
}

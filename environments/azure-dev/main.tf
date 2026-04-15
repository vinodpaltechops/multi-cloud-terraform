provider "azurerm" {
  features {}
}

# Simple resource group to verify provisioning works
resource "azurerm_resource_group" "terraform_test" {
  name     = "rg-tf-multicloud-${var.environment}"
  location = var.location

  tags = {
    environment = var.environment
    managed_by  = "terraform"
    pipeline    = "github-actions"
  }
}

# Simple storage account to verify provisioning works
resource "azurerm_storage_account" "terraform_test" {
  name                     = "tfmulticloud${var.environment}sa"
  resource_group_name      = azurerm_resource_group.terraform_test.name
  location                 = azurerm_resource_group.terraform_test.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}
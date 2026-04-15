output "resource_group_name" {
  description = "Created resource group name"
  value       = azurerm_resource_group.terraform_test.name
}

output "storage_account_name" {
  description = "Created storage account name"
  value       = azurerm_storage_account.terraform_test.name
}
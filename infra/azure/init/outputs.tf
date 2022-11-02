output "az_storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "az_storage_container" {
  value = azurerm_storage_container.sc.name
}

output "db_user" {
  value = "${azurerm_postgresql_server.db.administrator_login}@${azurerm_postgresql_server.db.name}"
}

output "db_password" {
  value     = random_password.db_password.result
  sensitive = true
}

output "db_host" {
  value = azurerm_postgresql_server.db.fqdn
}

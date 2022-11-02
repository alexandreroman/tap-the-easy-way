terraform {
  required_version = ">= 1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.29.1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.3"
    }
  }
}

provider "azurerm" {
  features {}
}

# Create the main Azure resource group.
resource "azurerm_resource_group" "tap" {
  name     = var.az_res_group
  location = var.az_location
}

# Define a random integer
resource "random_integer" "unique_id" {
  min = 1000
  max = 9999
}

# Create the storage account.
resource "azurerm_storage_account" "sa" {
  name                     = "${var.az_storage_account_name_prefix}${random_integer.unique_id.id}"
  resource_group_name      = azurerm_resource_group.tap.name
  location                 = azurerm_resource_group.tap.location
  account_replication_type = "LRS"
  account_tier             = "Standard"
  min_tls_version          = "TLS1_2"
}

# Create the storage container.
resource "azurerm_storage_container" "sc" {
  name                 = "tfstate"
  storage_account_name = azurerm_storage_account.sa.name
}

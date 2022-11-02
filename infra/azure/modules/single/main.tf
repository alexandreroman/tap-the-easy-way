# Get the main Azure resource group.
data "azurerm_resource_group" "tap" {
  name = var.az_res_group
}

# Create an Azure-managed PostgreSQL instance used by Backstage.
module "tap_gui_db" {
  source       = "../tap_gui_db"
  az_location  = data.azurerm_resource_group.tap.location
  az_res_group = data.azurerm_resource_group.tap.name
}

# Create the main AKS cluster with full profile.
resource "azurerm_kubernetes_cluster" "tap" {
  name                = var.az_aks_cluster
  location            = var.az_location
  resource_group_name = data.azurerm_resource_group.tap.name
  dns_prefix          = var.az_aks_cluster
  kubernetes_version  = "1.23"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name = "default"
    # Minimum node count.
    min_count = 3
    # Autoscaling is enabled by default, so new nodes will created / destroyed as needed.
    max_count = var.az_aks_cluster_nodes_max
    # Create nodes with 4 vCPU and 16 Gb.
    vm_size             = "Standard_D4_v3"
    enable_auto_scaling = true
  }

  auto_scaler_profile {
    expander = "least-waste"
  }
}

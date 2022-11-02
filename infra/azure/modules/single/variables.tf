variable "az_location" {
  type        = string
  default     = "francecentral"
  description = "Azure location for resources"
}

variable "az_res_group" {
  type        = string
  default     = "tap-demo"
  description = "Azure resource group"
}

variable "az_aks_cluster_nodes_max" {
  type        = number
  default     = 6
  description = "Max node count per cluster"
}

variable "az_aks_cluster" {
  type        = string
  default     = "tap"
  description = "AKS cluster name"
}

variable "tanzu_net_username" {
  type        = string
  description = "Tanzu Network username"
}

variable "tanzu_net_password" {
  type        = string
  description = "Tanzu Network password"
}

variable "tap_registry_username" {
  type        = string
  description = "TAP registry username"
}

variable "tap_registry_password" {
  type        = string
  description = "TAP registry password"
}

variable "tap_registry_hostname" {
  type        = string
  description = "TAP registry hostname"
}

variable "tap_registry_repo" {
  type        = string
  default     = "tap"
  description = "TAP registry repository"
}

variable "tap_title" {
  type        = string
  default     = "Tanzu Application Platform"
  description = "TAP instance title"
}

variable "tap_catalog" {
  type        = string
  default     = "https://github.com/alexandreroman/tap-catalog/blob/main/catalog-info.yaml"
  description = "TAP catalog"
}

variable "tap_version" {
  type        = string
  default     = "1.3.0"
  description = "TAP version"
}

variable "tap_ingress_domain" {
  type        = string
  description = "TAP ingress domain"
}

variable "github_access_token" {
  type        = string
  description = "GitHub access token"
}

variable "github_oidc_clientId" {
  type        = string
  description = "GitHub OIDC client id"
}

variable "github_oidc_clientSecret" {
  type        = string
  description = "GitHub OIDC client secret"
}

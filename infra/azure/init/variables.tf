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

variable "az_storage_account_name_prefix" {
  type        = string
  default     = "tap"
  description = "Azure storage account name prefix storing Terraform state"
}

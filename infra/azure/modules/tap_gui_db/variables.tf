variable "az_location" {
  type = string
}

variable "az_res_group" {
  type = string
}

variable "db_name" {
  type    = string
  default = "tap-db"
}

variable "db_user" {
  type    = string
  default = "psqladmin"
}

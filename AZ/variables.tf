variable "resource_group_name_prefix" {
  type        = string
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
  default     = "rg"
}

variable "sql_db_name" {
  type        = string
  description = "The name of the SQL Database."
  default     = "labsql"
}

variable "admin_username" {
  type        = string
  description = "The administrator username of the SQL logical server."
  default     = "azureadmin"
}

variable "admin_password" {
  type        = string
  description = "The administrator password of the SQL logical server."
  sensitive   = false
  default     = ""
}

variable "my_IP" {
  type        = string
  description = "My IP."
  sensitive   = false
  default     = "24.75.238.72"
}

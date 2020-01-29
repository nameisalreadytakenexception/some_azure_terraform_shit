variable "resourceGroupName" {
  type        = string
  description = "The name of resource group"
  default     = "my_cosmos_db_resource_group_295327"
}
variable "location" {
  type        = string
  description = "Location"
  default     = "westeurope"
}
variable "cosmos_db_account_name" {
  type        = string
  description = "name"
  default     = "my-cosmos-db-account-295327"
}
variable "eins_subnet_id" {
  type        = string
  description = "eins subnet id"
  default     = ""
}
variable "zwei_subnet_id" {
  type        = string
  description = "zwei subnet id"
  default     = ""
}
variable "vnet_list" {
  type        = string
  description = "allowed list of client IP's"
  default     = "10.0.0.0/16"
}
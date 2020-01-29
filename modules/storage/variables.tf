variable "resourceGroupName" {
  type        = string
  description = "The name of resource group"
  default     = "my_storage_resource_group_295327"
}
variable "location" {
  type        = string
  description = "Location"
  default     = "westeurope"
}
variable "storage_account_name" {
  type        = string
  description = "The name of virtual network"
  default     = "mystorage295327"
}
variable "storage_container_name" {
  type        = string
  description = "The name of virtual network"
  default     = "mystoragecontainer295327"
}
variable "resourceGroupName" {
  type        = string
  description = "The name of resource group"
  default     = "my_key_vault_resource_group_295327"
}
variable "location" {
  type        = string
  description = "Location"
  default     = "westeurope"
}
variable "key_vault_name" {
  type        = string
  description = "The name of virtual network"
  default     = "mykeyvault295327"
}
variable "tenant_id" {
  type        = string
  description = "tenant_id"
  default     = ""
}
variable "object_id" {
  type        = string
  description = "object_id"
  default     = ""
}
variable "all_permissions" {
  type        = list
  description = "list of permissions"
  default = [
    "get",
    "list",
    "update",
    "create",
    "import",
    "delete",
    "recover",
    "backup",
    "restore"
  ]
}
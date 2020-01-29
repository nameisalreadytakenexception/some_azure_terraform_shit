variable "resourceGroupName" {
  type        = string
  description = "The name of resource group"
  default     = "my_container_registry_resource_group_295327"
}
variable "location" {
  type        = string
  description = "Location"
  default     = "westeurope"
}
variable "container_registry_name" {
  type        = string
  description = "The name of container registry"
  default     = "mycontainerregistryawfvddrf"
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
variable "my_ip" {
  type        = string
  description = "my ip address"
  default     = ""
}
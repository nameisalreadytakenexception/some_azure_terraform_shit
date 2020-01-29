variable "resourceGroupName" {
  type        = string
  description = "The name of resource group"
  default     = "my_vlan_subnet_resource_group_295327"
}
variable "location" {
  type        = string
  description = "Location"
  default     = "westeurope"
}
variable "network_name" {
  type        = string
  description = "The name of virtual network"
  default     = "my_virtual_network_295327"
}
variable "network_address_space" {
  type        = string
  description = "The network address space"
  default     = "10.0.0.0/16"
}
variable "eins_subnet_address_prefix" {
  type        = string
  description = "The eins subnet address space"
  default     = "10.0.1.0/24"
}
variable "zwei_subnet_address_prefix" {
  type        = string
  description = "The zwei subnet address space"
  default     = "10.0.2.0/24"
}
variable "network_security_group_id" {
  type        = string
  description = "id of network_security_group"
  default     = ""
}
variable "resourceGroupName" {
  type        = string
  description = "The name of resource group"
  default     = "my_security_group_resource_group_295327"
}
variable "location" {
  type        = string
  description = "Location"
  default     = "westeurope"
}
variable "security_group_name" {
  type        = string
  description = "The name of virtual network"
  default     = "my_security_group_295327"
}
variable "inbound_port_ranges" {
  type        = list
  description = "list of allowed ports without 22 "
  default     = []
}
variable "k8s_port_ranges" {
  type        = list
  description = "list of allowed ports for k8s "
  default     = []
}
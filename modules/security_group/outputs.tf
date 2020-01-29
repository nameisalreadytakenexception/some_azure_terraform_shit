output "network_security_group_id" {
  description = "network_security_group_ids value"
  value       = azurerm_network_security_group.my_network_security_group.id
}
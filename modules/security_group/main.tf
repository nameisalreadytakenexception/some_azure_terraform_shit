resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}
resource "azurerm_network_security_group" "my_network_security_group" {
  name                = var.security_group_name
  resource_group_name = var.resourceGroupName
  location            = var.location
  depends_on          = [azurerm_resource_group.rg]
}
resource "azurerm_network_security_rule" "ssh" {
  name                        = "ssh"
  resource_group_name         = var.resourceGroupName
  network_security_group_name = azurerm_network_security_group.my_network_security_group.name
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
resource "azurerm_network_security_rule" "not_ssh" {
  count                       = length(var.inbound_port_ranges)
  name                        = "not_ssh_sg_rule_${count.index}"
  resource_group_name         = var.resourceGroupName
  network_security_group_name = azurerm_network_security_group.my_network_security_group.name
  priority                    = (100 + (count.index + 1))
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = element(var.inbound_port_ranges, count.index)
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
resource "azurerm_network_security_rule" "k8s" {
  name                        = "k8s_sg_rule"
  resource_group_name         = var.resourceGroupName
  network_security_group_name = azurerm_network_security_group.my_network_security_group.name
  priority                    = 548
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = var.k8s_port_ranges
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}
resource "azurerm_virtual_network" "my_network" {
  name                = var.network_name
  resource_group_name = var.resourceGroupName
  location            = var.location
  address_space       = [var.network_address_space]
  depends_on          = [azurerm_resource_group.rg]
}
resource "azurerm_subnet" "eins_subnet" {
  name                      = "eins_subnet_295327"
  virtual_network_name      = azurerm_virtual_network.my_network.name
  resource_group_name       = azurerm_resource_group.rg.name
  address_prefix            = var.eins_subnet_address_prefix
  network_security_group_id = var.network_security_group_id
  depends_on                = [azurerm_virtual_network.my_network]
  service_endpoints         = ["Microsoft.ContainerRegistry", "Microsoft.AzureCosmosDB"]
}
resource "azurerm_subnet" "zwei_subnet" {
  name                      = "zwei_subnet_295327"
  virtual_network_name      = azurerm_virtual_network.my_network.name
  resource_group_name       = azurerm_resource_group.rg.name
  address_prefix            = var.zwei_subnet_address_prefix
  network_security_group_id = var.network_security_group_id
  depends_on                = [azurerm_virtual_network.my_network]
  service_endpoints         = ["Microsoft.ContainerRegistry", "Microsoft.AzureCosmosDB"]
}
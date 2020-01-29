resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}
resource "azurerm_container_registry" "my_container_registry" {
  name                = var.container_registry_name
  location            = var.location
  resource_group_name = var.resourceGroupName
  sku                 = "Premium" #"Standart"
  depends_on          = [azurerm_resource_group.rg]
  network_rule_set {
    default_action = "Deny"
    virtual_network = [{
      subnet_id = var.eins_subnet_id
      action    = "Allow"
      },
      {
        subnet_id = var.zwei_subnet_id
        action    = "Allow"
    }]
    ip_rule {
      action   = "Allow"
      ip_range = var.my_ip
    }
  }
}
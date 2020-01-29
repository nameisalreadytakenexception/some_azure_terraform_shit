resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}
resource "azurerm_cosmosdb_account" "mycosmosdb" {
  name                      = var.cosmos_db_account_name
  location                  = var.location
  resource_group_name       = var.resourceGroupName
  offer_type                = "Standard"
  kind                      = "GlobalDocumentDB"
  depends_on                = [azurerm_resource_group.rg]
  enable_automatic_failover = true
  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  is_virtual_network_filter_enabled = true
  virtual_network_rule {
    id = var.eins_subnet_id
  }
  virtual_network_rule {
    id = var.zwei_subnet_id
  }
  ip_range_filter = var.vnet_list
}
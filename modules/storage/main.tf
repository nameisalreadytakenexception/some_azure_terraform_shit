resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}
resource "azurerm_storage_account" "my_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resourceGroupName
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  depends_on               = [azurerm_resource_group.rg]
}
resource "azurerm_storage_container" "my_storage_container" {
  name                  = var.storage_container_name
  resource_group_name   = var.resourceGroupName
  storage_account_name  = var.storage_account_name
  container_access_type = "blob"
  depends_on            = [azurerm_storage_account.my_storage_account]
}
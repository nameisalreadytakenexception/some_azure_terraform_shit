resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}
resource "azurerm_key_vault" "my-key-vault" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resourceGroupName
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  depends_on                  = [azurerm_resource_group.rg]
  access_policy {
    tenant_id           = var.tenant_id
    object_id           = var.object_id
    key_permissions     = var.all_permissions
    secret_permissions  = ["get", "delete", "set"]
    storage_permissions = ["get"]
  }
}
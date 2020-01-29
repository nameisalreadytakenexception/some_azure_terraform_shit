resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}
module "network" {
  source                     = "./modules/vlan_subnet"
  network_address_space      = "10.0.0.0/16"
  eins_subnet_address_prefix = "10.0.1.0/24"
  zwei_subnet_address_prefix = "10.0.2.0/24"
  network_security_group_id  = module.sg.network_security_group_id
}
module "sg" {
  source              = "./modules/security_group"
  inbound_port_ranges = ["80", "8080"]
  k8s_port_ranges     = ["3306", "8443"] #ports for example:)
}
module "storage" {
  source = "./modules/storage"
}
module "key_vault" {
  source    = "./modules/key_vault"
  object_id = ""
  tenant_id = ""
}
module "registry" {
  source         = "./modules/container_registry"
  eins_subnet_id = module.network.eins_subnet_id
  zwei_subnet_id = module.network.zwei_subnet_id
  my_ip          = "127.0.0.1" # have to be your not localhost ip
}
module "cosmosdb" {
  source         = "./modules/cosmos_db"
  eins_subnet_id = module.network.eins_subnet_id
  zwei_subnet_id = module.network.zwei_subnet_id
  vnet_list      = "10.0.0.0/16,127.0.0.1"
}
terraform {
  backend "azurerm" {
    resource_group_name  = "web_app_resource_group"
    storage_account_name = "myazurestorage56479"
    container_name       = "myazurecontainer1564"
    key                  = "./terraform.tfstate"
  }
}
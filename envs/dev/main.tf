module "network" {
  source              = "../../modules/network"
  vnet_name           = "dev-vnet"
  address_space       = ["10.10.0.0/16"]
  subnet_name         = "dev-subnet"
  subnet_prefix       = ["10.10.1.0/24"]
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  allowed_ssh_cidrs   = var.allowed_ssh_cidrs
}

module "vm" {
  source                       = "../../modules/vm"
  vms                          = var.vms
  location                     = var.location
  resource_group_name          = var.resource_group_name
  subnet_id                    = module.network.subnet_id
  tags                         = var.tags
  boot_diagnostics_storage_uri = var.boot_diagnostics_storage_uri
}

output "dev_vm_private_ips" {
  value = module.vm.private_ips
}


resource "azurerm_resource_group" "dev" {
  name     = "rgs-dev"
  location = "eastus"
}

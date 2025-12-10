terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "yomistatestorage" # same or different SA; up to you
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
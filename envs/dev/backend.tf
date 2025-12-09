terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "yomistatestorage"    # change to your storage account
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

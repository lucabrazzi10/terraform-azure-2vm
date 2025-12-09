terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

provider "azurerm" {
  features {}

  # Explicitly set these so the provider stops guessing
  subscription_id = "4a6073fe-2b94-4a1d-8244-0e7536b426c9"
  tenant_id       = "579212bc-d624-46e6-b537-81a8cc6bf02e"
}

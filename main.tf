# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = $subscription_id
  client_id       = $client_id
  client_secret   = $client_secret
  tenant_id       = $tenant_id
}

resource "azurerm_resource_group" "rg" {
  name     = "WEgroup"
  location = "West Europe"
}

    terraform {
      backend "remote" {
        # The name of your Terraform Cloud organization.
        organization = "lokdemo"

        # The name of the Terraform Cloud workspace to store Terraform state files in.
        workspaces {
          name = "terraformcloud"
        }
      }
    }

# # We strongly recommend using the required_providers block to set the
# # Azure Provider source and version being used
# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "=2.46.0"
#     }
#   }
# }

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = ${{ secrets.subscription_id }}
  client_id       = ${{ secrets.client_id }}
  client_secret   = ${{ secrets.client_secret }}
  tenant_id       = ${{ secrets.tenant_id }}
}

#Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "WEgroup"
  location = "West Europe"
}

#Create a Virtual Network with resource group
resource "azurerm_virtual_network" "vnet" {
  name                = "Vnet-tf"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

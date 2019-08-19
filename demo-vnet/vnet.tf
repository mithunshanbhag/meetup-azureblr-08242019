provider "azurerm" {
  version = "=1.28.0" # pin to version 1.28.0
}

resource "azurerm_resource_group" "azureblr_demo_rg" {
  name     = "azureblr-demo-rg"
  location = "south india"
  tags = {
    environment = "testing"
  }
}

resource "azurerm_virtual_network" "bb_virtual_networks" {
  resource_group_name = "azureblr-demo-rg"
  location            = "south india"

  name          = "azureblr-demo-vnet"
  address_space = ["10.0.0.0/16"]

  subnet {
    name           = "web-subnet"
    address_prefix = "10.0.0.0/24"
  }
  subnet {
    name           = "db-subnet"
    address_prefix = "10.0.1.0/24"
  }
}

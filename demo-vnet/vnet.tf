# variables

variable "rg_name" {
  default = "azureblr-demo-rg"
}

variable "rg_location" {
  default = "south india"
}

variable "vnet_name" {
  default = "azureblr-demo-vnet"
}

variable "vnet_address_prefix" {
  default = ["10.0.0.0/16", "10.1.0.0/16"]
}

variable "web_subnet_name" {
  default = "web-subnet"
}

variable "web_subnet_address_prefix" {
  default = "10.0.0.0/24"
}

variable "db_subnet_name" {
  default = "db-subnet"
}

variable "db_subnet_address_prefix" {
  default = "10.0.1.0/24"
}

# providers

provider "azurerm" {
  version = "=1.28.0" # pin to version 1.28.0
}

# resources

resource "azurerm_resource_group" "azureblr_demo_rg" {
  name     = "${var.rg_name}"
  location = "${var.rg_location}"
  tags = {
    environment = "testing"
  }
}

resource "azurerm_virtual_network" "azureblr_demo_vnet" {
  # adds implicit dependency on the resource group
  resource_group_name = "${azurerm_resource_group.azureblr_demo_rg.name}"
  location            = "${azurerm_resource_group.azureblr_demo_rg.location}"

  name          = "${var.vnet_name}"
  address_space = "${var.vnet_address_prefix}"

  subnet {
    name           = "${var.web_subnet_name}"
    address_prefix = "${var.web_subnet_address_prefix}"
  }
  subnet {
    name           = "${var.db_subnet_name}"
    address_prefix = "${var.db_subnet_address_prefix}"
  }

  tags = {
    environment = "testing"
  }
}

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "random" {}

provider "azurerm" {
  features {}
}

resource "random_pet" "my_pet_name" {
  length    = 3
  separator = "-"
}

# Random UUID
resource "random_uuid" "my_uuid" {}

resource "azurerm_resource_group" "network_rg" {
  name     = var.network_rg_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_space]

  service_endpoints = ["Microsoft.KeyVault"]
}
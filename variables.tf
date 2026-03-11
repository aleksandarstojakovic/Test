variable "network_rg_name" {
  description = "Name of the Network Resource Group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space of the VNet"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_address_space" {
  description = "Subnet address space"
  type        = string
}
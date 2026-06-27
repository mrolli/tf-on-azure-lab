# Specifiy the provider and version
terraform {
  required_version = ">= 1.15.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

module "lab" {
  source = "./modules/lab"

  workload_name    = var.workload_name
  region           = var.region
  resource_groups  = var.resource_groups
  virtual_networks = var.virtual_networks
  tags             = var.tags
}

moved {
  from = azurerm_resource_group.lab
  to   = module.lab.azurerm_resource_group.lab
}

moved {
  from = azurerm_virtual_network.lab
  to   = module.lab.azurerm_virtual_network.lab
}

moved {
  from = azurerm_subnet.lab
  to   = module.lab.azurerm_subnet.lab
}

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

# Create the very first resource
resource "azurerm_resource_group" "lab" {
  for_each = var.resource_groups

  name     = each.value
  location = var.region
  tags     = var.tags
}

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
resource "azurerm_resource_group" "this" {
  name     = "rg-lab-mr-test"
  location = "switzerlandnorth"

  tags = {
    Environment = "test"
    ManagedBy   = "terraform"
  }
}

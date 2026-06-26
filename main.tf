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
resource "azurerm_resource_group" "lab-test" {
  name     = "rg-${var.workload_name}-test"
  location = var.region
  tags     = var.tags
}

# Create the very first resource
resource "azurerm_resource_group" "lab-prod" {
  name     = "rg-${var.workload_name}-prod"
  location = var.region
  tags     = merge(var.tags, { Environment = "prod" })
}

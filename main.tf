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

locals {
  workload_name = "lab-mr"
  region        = "switzerlandnorth"
  tags = {
    Environment = "test"
    ManagedBy   = "terraform"
  }
}

# Create the very first resource
resource "azurerm_resource_group" "lab-test" {
  name     = "rg-${local.workload_name}-test"
  location = local.region

  tags = local.tags
}

# Create the very first resource
resource "azurerm_resource_group" "lab-prod" {
  name     = "rg-${local.workload_name}-prod"
  location = local.region

  tags = merge(local.tags, { Environment = "prod" })
}

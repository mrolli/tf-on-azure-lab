variable "resource_groups" {
  type        = map(string)
  description = "The resource groups to deploy"
}

variable "workload_name" {
  type = string
}

variable "region" {
  type        = string
  default     = "switzerlandnorth"
  description = "The Azure region to deploy resources in"
  validation {
    condition     = contains(["switzerlandnorth", "westeurope"], var.region)
    error_message = "Invalid region. Allowed values are 'switzerlandnorth' and 'westeurope'."
  }
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to assign to resources"
}

variable "virtual_networks" {
  type = map(object({
    name               = string
    resource_group_key = string
    address_space      = list(string)
    subnets = map(object({
      name           = optional(string)
      address_prefix = string
    }))
  }))
  description = "The virtual networks to deploy"
}

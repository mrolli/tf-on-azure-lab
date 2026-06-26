variable "workload_name" {}

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

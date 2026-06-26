resource_groups = {
  dev     = "rg-lab-mr-dev"
  staging = "rg-lab-mr-staging"
  prod    = "rg-lab-mr-prod"
}

tags = {
  Environment = "test"
  ManagedBy   = "terraform"
}

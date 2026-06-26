output "rg_lab_test_id" {
  value = azurerm_resource_group.lab-test.id
}

output "rg_lab_prod_id" {
  value       = azurerm_resource_group.lab-prod.id
  description = "Do not show actual data on CLI output"
  sensitive   = true
}

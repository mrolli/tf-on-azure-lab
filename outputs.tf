output "resource_group_ids" {
  value       = { for k, v in azurerm_resource_group.lab : k => v.id }
  description = "Resource group ids"
}

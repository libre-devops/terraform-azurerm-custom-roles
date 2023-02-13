output "role_assignment" {
  value       = var.create_role == true && var.assign_role == true ? azurerm_role_assignment.role_assignment_custom_role[*] : azurerm_role_assignment.role_assignment_inbuilt_role[*]
  description = "The full role assignment object"
}

output "role_definition" {
  value       = azurerm_role_definition.role_definitions[*]
  description = "The full role definitions object"
}

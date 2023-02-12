resource "azurerm_role_assignment" "role_assignment" {
  for_each           = var.assign_role == true ? { for idx, value in var.role_assignments: value.role_assignment_name => merge(value { index = idx }) } : null
  scope              = each.value.role_assignment_scope
  role_definition_id = azurerm_role_definition.role_definition[each.key].id
  principal_id       = each.value.role_assignment_assignee_principal_id
}